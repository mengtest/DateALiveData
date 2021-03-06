
local TFLabelEx = {}

-- 设置文本，自动区分普通文本和富文本，为兼容多语言版本，尽量使用setTextById，而不是setText
-- @param id string.csv里的id
-- @param ... %s的替换参数

local __setText = Label.setText

local function setText(self,format, ...)
    local label = TFDirector:getChildByPath(self:getParent(), "systemFont_"..self:getName())
    if label then
        self:setVisible(label:isVisible())
        label:RemoveSelf()
        label = nil
    end

    if self.__richText then
        self:setVisible(self.__richText:isVisible())
        self.__richText:RemoveSelf()
        self.__richText = nil
    end
    __setText(self,format,...)
end
rawset(Label, "setText", setText)

function TFLabelEx:setTextById(id, ...)
    local textAttr = TextDataMgr:getTextAttr(id)
    if textAttr then
        return self:setTextByAttr(textAttr, ...)
    else
        local text = string.format("string %s not found", id)
        return self:setText(text)
    end
end

function TFLabelEx:setTextByAttr(textAttr, ...)
    if TextDataMgr:isRString(textAttr) then
        local content = TextDataMgr:getFormatText(textAttr, ...)
        return self:setTextEx(content, true)
    else
        --self:setTextEffect(textAttr);

        local content = textAttr.text
        if #{...} > 0 then
            content = string.format(content, ...)
        end
        return self:setTextEx(content)
    end
end

function  TFLabelEx:setTextEffect(textAttr)
    --字体颜色 透明度
    if table.count(textAttr.font) > 0  then
        local color = ccc3(textAttr.font[1],textAttr.font[2],textAttr.font[3])
        local opcity = textAttr.font[4] or 255
        self:setColor(color);
        self:setOpacity(opcity);
    end
    --外发光
    if table.count(textAttr.colour) > 0 then
        local color = ccc4(textAttr.colour[1],textAttr.colour[2],textAttr.colour[3],textAttr.colour[4]);
        self:enableGlow(color);
    end
    --描边
    if table.count(textAttr.stroke) > 0 then
        local color = ccc4(textAttr.stroke[1],textAttr.stroke[2],textAttr.stroke[3],textAttr.stroke[4]);
        local outlineSize = textAttr.stroke[5]
        self:enableOutline(color,outlineSize);
    end
end

function TFLabelEx:setTextEx(text, isRString)
    if isRString then
        if not self.__richText then
            local size = self:getDimensions()
            local richText = TFRichText:create(size)
            richText:setFixLineHeight(true)
            if self:getParent() then
                richText:AddTo(self:getParent())
            end
            richText:AnchorPoint(self:AnchorPoint())
            richText:Pos(self:Pos())
            richText:ZO(self:ZO())
            richText:setRotation(self:getRotation())
            self.__richText = richText
        end
        self:hide()
        local richText = self.__richText
        richText:setText(text)
        self.__richText = richText
        return richText
    else
        if self.__richText then
            self.__richText:RemoveSelf()
            self.__richText = nil
        end
        self:setText(text)
        return self
    end
end

function TFLabelEx:printerHandle(textAttr, completeHandle, ...)
    local index = 1
    local content = textAttr.text
    if #{...} > 1 then
        content = string.format(content, ...)
    end
    local splitText = string.UTF8ToCharArray(content)
    return function()
        local endFlag = false
        if index > #splitText then
            completeHandle()
            endFlag = true
        else
            local attr = clone(textAttr)
            attr.text = table.concat(splitText, nil, 1, index)
            self:setTextByAttr(attr)
            index = index + 1
        end
        return endFlag
    end
end


function TFLabelEx:rPrinterHandle(textAttr, completeHandle, ...)
    local tmpTextAttr = clone(textAttr)
    for i = 1, #tmpTextAttr do
        table.remove(tmpTextAttr, 1)
    end

    -- 用变长参数替换%s
    local text = {}
    for i, v in ipairs(textAttr) do
        table.insert(text, v.text)
    end
    local tmpContent = table.concat(text, "\t")

    local param = clone(...)

    if #{...} > 0 then
        tmpContent = string.format(tmpContent, ...)
    end
    text = string.split(tmpContent, "\t")

    local itemIndex = 1
    local charIndex = 1
    return function()
        local endFlag = false
        if itemIndex > #textAttr then
            completeHandle()
            endFlag = true
        else
            local item = clone(textAttr[itemIndex])
            local splitText = string.UTF8ToCharArray(text[itemIndex])
            if charIndex > #splitText then
                itemIndex = itemIndex + 1
                charIndex = 1
            else
                local attr = clone(tmpTextAttr)
                for i = 1, itemIndex - 1 do
                    local item = clone(textAttr[i])
                    table.insert(attr, item)
                end
                item.text = table.concat(splitText, nil, 1, charIndex)
                table.insert(attr, item)
                self:setTextByAttr(attr,param)
                charIndex = charIndex + 1
            end
        end
        return endFlag
    end
end

-- 打字机
local PRINTER_ACTION_TAG = 0xabcd
function TFLabelEx:printer(id, speedHandle, completeHandle, ...)
    local speed = 0.1
    assert(not speedHandle or type(speedHandle) == "number" or type(speedHandle) == "function", "speedHandle support type(number, function, nil)")
    assert(not completeHandle or type(completeHandle) == "function", "completeHandle support type(function, nil)")
    if type(speedHandle) == "number" then
        speed = speedHandle
    end
    completeHandle = completeHandle or function() end

    local textAttr = TextDataMgr:getTextAttr(id)
    local handle
    if TextDataMgr:isRString(textAttr) then
        handle = self:rPrinterHandle(textAttr, completeHandle, ...)
    else
        handle = self:printerHandle(textAttr, completeHandle, ...)
    end

    local function run()
        local seq = Sequence:create({
                CallFunc:create(function()
                        if type(speedHandle) == "function" then
                            speed = speedHandle(index) or speed
                        end
                end),
                DelayTime:create(speed),
                CallFunc:create(function()
                        if not handle() then
                            run()
                        end
                end)
        })
        self:stopAllActions()
        self:runAction(seq)
    end
    self:setText("")
    run()
end

function TFLabelEx:setSystemFontText( text )
    if CC_TARGET_PLATFORM == CC_PLATFORM_WIN32 or (not(EX_ASSETS_ENABLE == true)) then
        self:setText(text)
        return self, false
    end

    local label = TFDirector:getChildByPath(self:getParent(), "systemFont_"..self:getName())
    if label == nil then
        local fontSize = self:getFontSize()
        local dimensions = self:getDimensions()
        local hAlignment = self:getHorizontalAlignment()
        label = Label:create()
        label:setName("systemFont_"..self:getName())
        label:setSystemFontName("Helvetica")
        label:setSystemFontSize(fontSize)
        if self:getParent() then
            label:AddTo(self:getParent())
        end
        label:setAnchorPoint(self:getAnchorPoint())
        label:setColor(self:getColor())
        label:setFontFillColor(self:getTextColor())
        label:Pos(self:Pos())
        label:ZO(self:ZO())
        label:setRotation(self:getRotation())
        label:setDimensions(dimensions.width,dimensions.height)
        label:setVisible(self:isVisible())
    end
    self:hide()   
    label:setString(text)
    return label, true
end

function TFLabelEx:setSystemFontTextById( id, ... )
    if not (EX_ASSETS_ENABLE == true) then
        self:setTextById(id, ...)
        return
    end

    if textAttr and (not TextDataMgr:isRString(textAttr)) then
        local textAttr = TextDataMgr:getTextAttr(id)
        local content = textAttr.text
        if #{...} > 0 then
            content = string.format(content, ...)
        end
        self:setSystemFontText(content)
        return
    end
    self:setTextById(id, ...)
end

----------------------------------------------------

for k, v in pairs(TFLabelEx) do
    if not rawget(Label, k) and type(v) == "function" then
        rawset(Label, k, v)
    end
end
