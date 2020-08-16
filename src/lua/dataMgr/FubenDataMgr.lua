
local BaseDataMgr = import(".BaseDataMgr")
local FubenDataMgr = class("FubenDataMgr", BaseDataMgr)

local maxStarLimit = 3
local UserDefault = CCUserDefault:sharedUserDefault()

function FubenDataMgr:init()
    TFDirector:addProto(s2c.DUNGEON_GET_LEVEL_INFO, self, self.onRecvLevelInfo)
    TFDirector:addProto(s2c.DUNGEON_UPADTE_LEVEL_INFO, self, self.onRecvAllLevelInfo)
    TFDirector:addProto(s2c.DUNGEON_FIGHT_START, self, self.onRecvFightStart)
    TFDirector:addProto(s2c.DUNGEON_FIGHT_OVER, self, self.onRecvFightOver)
    TFDirector:addProto(s2c.PLAYER_REPS_HELP_FIGHT_PLAYERS, self, self.onRecvFightAsstiant)
    TFDirector:addProto(s2c.DUNGEON_GET_LEVEL_GROUP_REWARD, self, self.onRecvLevelGroupReward)
    TFDirector:addProto(s2c.DUNGEON_UPDATE_LEVEL_GROUP_INFO, self, self.onRecvUpdateLevelGroupInfo)
    TFDirector:addProto(s2c.DUNGEON_LEVEL_INFOS, self, self.onRecvUpdateLevelInfo)
    TFDirector:addProto(s2c.DUNGEON_BUY_FIGHT_COUNT, self, self.onRecvBuyFightCount)
    TFDirector:addProto(s2c.ENDLESS_CLOISTER_RSP_ENDLESS_CLOISTER_INFO, self, self.onRecvEndlessInfo)
    TFDirector:addProto(s2c.ENDLESS_CLOISTER_RSP_START_FIGHT_ENDLESS, self, self.onRecvStartFightEndless)
    TFDirector:addProto(s2c.ENDLESS_CLOISTER_RSP_PASS_STAGE_ENDLESS, self, self.onRecvPassEndless)
    TFDirector:addProto(s2c.DUNGEON_LIMIT_HERO_DUNGEON, self, self.onRecvLimitHeros)
    TFDirector:addProto(s2c.DUNGEON_GROUP_MULTIPLE_REWARD, self, self.onRecvGroupMultipleReward)
    TFDirector:addProto(s2c.DUNGEON_BUY_LEVEL_COUNT, self, self.onRecvLevelBuyCount)
    TFDirector:addProto(s2c.HERO_CHALLENGE_CHALLENGE_INFO, self, self.onRecvSpriteChallengeInfo)
    TFDirector:addProto(s2c.HERO_CHALLENGE_REFRESH_BUFF, self, self.onRecvSpriteRefreshBuffer)
    TFDirector:addProto(s2c.HERO_CHALLENGE_CHALLENGE_AWARD, self, self.onRecvGetSpriteReward)
    TFDirector:addProto(s2c.HERO_PRACTICE_PRACTICE_INFO, self, self.onRecvSpriteExtraLevelsInfo)
    TFDirector:addProto(s2c.HERO_PRACTICE_PRACTICE_LEVEL_INFO, self, self.onRecvSpriteExtraLevelUpdateInfo)
    TFDirector:addProto(s2c.ENDLESS_CLOISTER_RSP_ENDLESS_RANK_LIST, self, self.onRecvEndlessRank)
    TFDirector:addProto(s2c.ENDLESS_CLOISTER_RSP_ENDLESS_BUFF, self, self.onRecvEndlessLevelBuff)
    TFDirector:addProto(s2c.ENDLESS_CLOISTER_RSP_START_STAGE, self, self.onRecvEndlessJumpLevel)
    TFDirector:addProto(s2c.ODEUM_OPEN_PANEL, self, self.onRecvOpenTheaterBossInfo)
    TFDirector:addProto(s2c.ODEUM_RESQ_RANK, self, self.onRecvTheaterRank)
    TFDirector:addProto(s2c.ODEUM_RESP_NODE_PRIZE, self, self.onRecvTheaterNodeReward)
    TFDirector:addProto(s2c.ODEUM_UPDATE_BOSS_DUNGEON, self, self.onRecvTheaterLevelCid)
    TFDirector:addProto(s2c.ODEUM_UPDATE_LINGBO, self, self.onRecvTheaterLingbo)
    TFDirector:addProto(s2c.ODEUM_UPDATE_BOSS_STATUS, self, self.onRecvTheaterStatus)
    TFDirector:addProto(s2c.ODEUM_RESP_NODE_PRIZE, self, self.onRecvTheaterReceiveReward)
    TFDirector:addProto(s2c.ODEUM_RESQ_ODEUM_LEVEL_INFO, self, self.onRecvTheaterLevelInfo)
    TFDirector:addProto(s2c.ODEUM_LEVEL_SPECIAL_CONDITIONS, self, self.onRecvUpdateTheaterOptionInfo)
    TFDirector:addProto(s2c.ODEUM_LEVEL_RECORD, self, self.onRecvUpdateTheaterLevelOrder)
    TFDirector:addProto(s2c.ODEUM_UPDATE_CONTRIBUTION, self, self.onRecvUpdateTheaterContribution)
    TFDirector:addProto(s2c.ODEUM_RESP_NOTICE, self, self.onRecvUpdateTheaterNotice)
    TFDirector:addProto(s2c.ODEUM_RESP_SELF_CONTRI_PRIZE, self, self.onRecvTheaterReward)
    TFDirector:addProto(s2c.ODEUM_RESP_UPDATE_FINISH_PROCESS, self, self.onRecvUpdataTheaterContorProcess)
    TFDirector:addProto(s2c.ODEUM_RESP_FINISH_PROCESS, self, self.onRecvTheaterContorProcess)
    TFDirector:addProto(s2c.HERO_RES_SIMULATE_TRAIN_INFO, self, self.onRevSimulationTrialInfo)
    TFDirector:addProto(s2c.HERO_RES_COMPLETE_STTASK, self, self.onRevCompleteSTTask)
    TFDirector:addProto(s2c.HERO_RES_STTASK_CHANGE, self, self.onRevSTTaskChange)
    --海王星联动
    TFDirector:addProto(s2c.DUNGEON_RESP_TIME_LINKAGE_INFO, self, self.onRevLinkageInfo)
    TFDirector:addProto(s2c.DUNGEON_RESP_TIME_LINKAGE_CG, self, self.onRevLinkageCG)

    -- 章节
    self.chapterMap_ = TabDataMgr:getData("DungeonChapter")
    self.chapter_ = {}
    for k, v in pairs(self.chapterMap_) do
        self.chapter_[v.type] = self.chapter_[v.type] or {}
        table.insert(self.chapter_[v.type], v.id)
    end
    for k, v in pairs(self.chapter_) do
        table.sort(v, function(a, b)
                       local cfgA = self.chapterMap_[a]
                       local cfgB = self.chapterMap_[b]
                       return cfgA.order < cfgB.order
        end)
    end

    -- 关卡组
    self.levelGroupMap_ = TabDataMgr:getData("DungeonLevelGroup")
    self.levelGroup_ = {}
    for k, v in pairs(self.levelGroupMap_) do
        self.levelGroup_[v.dungeonChapterId] = self.levelGroup_[v.dungeonChapterId] or {}
        table.insert(self.levelGroup_[v.dungeonChapterId], v.id)
    end
    for k, v in pairs(self.levelGroup_) do
        table.sort(v, function(a, b)
                       local cfgA = self.levelGroupMap_[a]
                       local cfgB = self.levelGroupMap_[b]
                       return cfgA.order < cfgB.order
        end)
    end

    -- 关卡
    self.levelMap_ = TabDataMgr:getData("DungeonLevel")
    self.level_ = {}
    for k, v in pairs(self.levelMap_) do
        self.level_[v.levelGroupId] = self.level_[v.levelGroupId] or {}
        table.insert(self.level_[v.levelGroupId], v.id)
    end
    for k, v in pairs(self.level_) do
        table.sort(v, function(a, b)
                       local cfgA = self.levelMap_[a]
                       local cfgB = self.levelMap_[b]
                       return cfgA.num < cfgB.num
        end)
    end

    -- 精灵副本
    self.challengeDungenMap_ = TabDataMgr:getData("ChallengeDungen")
    self.challengeDungen_ = {}
    for k, v in pairs(self.challengeDungenMap_) do
        self.challengeDungen_[v.dungenLevel] = v
    end

    -- 万由里
    self.storyDungeonLevelMap_ = TabDataMgr:getData("StoryDungeonLevel")
    self.storyDungeonLevel_ = {}
    for k, v in pairs(self.storyDungeonLevelMap_) do
        local levels = self.storyDungeonLevel_[v.chapter] or {}
        table.insert(levels, k)
        self.storyDungeonLevel_[v.chapter] = levels
    end
    self.storyGroupDungeonLevel_ = {}
    for chapterCid, v in pairs(self.storyDungeonLevel_) do
        local groupLevels = self.storyGroupDungeonLevel_[chapterCid] or {}
        for _, levelCid in ipairs(v) do
            local levelCfg = self.storyDungeonLevelMap_[levelCid]
            local levels = groupLevels[levelCfg.group] or {}
            table.insert(levels, levelCid)
            groupLevels[levelCfg.group] = levels
        end
        self.storyGroupDungeonLevel_[chapterCid] = groupLevels
    end
    for _, groupLevels in pairs(self.storyGroupDungeonLevel_) do
        for _, levels in pairs(groupLevels) do
            table.sort(levels, function(a, b)
                           local levelCfgA = self.storyDungeonLevelMap_[a]
                           local levelCfgB = self.storyDungeonLevelMap_[b]
                           return levelCfgA.groupCenter > levelCfgB.groupCenter
            end)
        end
    end

    -- 剧情副本关卡名字
    self.levelName_ = {}
    local plotChapter = self.chapter_[EC_FBType.PLOT]
    for i, chapterId in ipairs(plotChapter) do
        local levelIndex = {}
        local freeLevelIndex = {}
        local chapterCfg = self.chapterMap_[chapterId]
        local levelGroup = self.levelGroup_[chapterId]
        for _, levelGroupId in ipairs(levelGroup) do
            local levelGroupCfg = self.levelGroupMap_[levelGroupId]
            for _, diff in pairs(EC_FBDiff) do
                local level = self:getLevel(levelGroupId, diff)
                for _, levelId in ipairs(level) do
                    local levelCfg = self.levelMap_[levelId]
                    if levelCfg.isFree then
                        local index = freeLevelIndex[diff] or 0
                        freeLevelIndex[diff] = index + 1
                        self.levelName_[levelId] = TextDataMgr:getText(300307, chapterCfg.orderName, freeLevelIndex[diff])
                    else
                        local index = levelIndex[diff] or 0
                        levelIndex[diff] = index + 1
                        self.levelName_[levelId] = TextDataMgr:getText(300306, chapterCfg.orderName, levelIndex[diff])
                    end
                end
            end
        end
    end

    ---狂三副本
    self.ksDungeonCityCfgMap = {}
    self.ksDungeonCityCfg = TabDataMgr:getData("KurumiDungeonCity")
    for k,v in ipairs(self.ksDungeonCityCfg) do
        self.ksDungeonCityCfgMap[v.dungeon] = v
    end

    -- 无尽副本
    self.endlessCloisterLevel_ = {}
    self.endlessCloisterLevelMap_ = TabDataMgr:getData("EndlessCloisterLevel")
    for k, v in pairs(self.endlessCloisterLevelMap_) do
        local week = self.endlessCloisterLevel_[v.week] or {}
        self.endlessCloisterLevel_[v.week] = week
        table.insert(week, k)

    end
    for k, v in pairs(self.endlessCloisterLevel_) do
        table.sort(v, function(a, b)
                       local cfgA = self.endlessCloisterLevelMap_[a]
                       local cfgB = self.endlessCloisterLevelMap_[b]
                       return cfgA.order < cfgB.order
        end)
    end

    -- 所有关卡信息
    self.levelInfo_ = {}

    -- 所有关卡组信息
    self.levelGroupInfo_ = {}

    -- 无尽回廊信息
    self.endlessInfo_ = {}

    -- 解锁下一章节的当前章节ID
    self.unlockNextChapterCid_ = nil

    -- 助战列表
    self.assistantData_=  {}

    -- 限定英雄信息
    self.limitHeros_ = {}
    self.originLevelFormation_ = {}
    self.levelFormation_ = {}

    -- 当前关卡
    self.curLevelCid_ = nil

    -- 日常副本多倍奖励信息
    self.dailyMultipleInfo_ = {}

    -- 精灵副本信息
    self.spriteChallengeInfo_ = {}

    --精灵外传副本数据
    self.spriteExtraInfo_ = {}

    -- 万由里关卡顺序
    self.theaterLevelOrder_ = {}
    -- 万由里关卡顺序权重
    self.theaterLevelWeight_ = {}
    -- 万由里章节动画播放，每次登陆重置
    self.theaterLevelAni_ = {}
    -- 万由里约会选项信息
    self.theaterDatingOptionInfo_ = {}
    -- 万由里boss挑战信息
    self.theaterNotice_ = {}
    self.theaterControlProcess = {}
    -- 模拟试炼数据
    self.simulationTrialInfo_ = {}

    --检查是否需要检测所关卡全部完成
    self.isNeedCheckAllPassWin = false
end

function FubenDataMgr:reset()
    self.levelInfo_ = {}
    self.levelGroupInfo_ = {}
    self.selectLevelGroup_ = nil
    self.selectChapter_ = nil
    self.selectFubenType_ = nil
    self.selectLevelGroup_ = nil
    self.dailyMultipleInfo_ = {}
    self.theaterDatingOptionInfo_ = {}
    self.theaterLevelOrder_ = {}
    self.theaterLevelWeight_ = {}
    self.theaterLevelAni_ = {}
    self.theaterNotice_ = {}
    self.dailyMultipleInfo_ = {}
    self.spriteChallengeInfo_ = {}
    self.spriteExtraInfo_ = {}
    self.theaterControlProcess = {}
    self.simulationTrialInfo_ = {}
    self.lastCycleList =  {}
    self.presentRankList = {}
    self.simulationTrialReward = nil
    self.linkageInfo = nil
end

function FubenDataMgr:onLoginOut()
    self:reset()
end

function FubenDataMgr:onLogin()
    local waitList = {
        s2c.DUNGEON_GET_LEVEL_INFO,
        s2c.ENDLESS_CLOISTER_RSP_ENDLESS_CLOISTER_INFO,
        s2c.DUNGEON_GROUP_MULTIPLE_REWARD,
        s2c.HERO_CHALLENGE_CHALLENGE_INFO,
        s2c.HERO_PRACTICE_PRACTICE_INFO,
        s2c.ODEUM_OPEN_PANEL,
        s2c.ODEUM_RESQ_ODEUM_LEVEL_INFO,
        s2c.HERO_REQ_SIMULATE_TRAIN_INFO,
        s2c.DUNGEON_RESP_TIME_LINKAGE_INFO,
    }

    TFDirector:send(c2s.DUNGEON_GET_LEVEL_INFO, {})
    TFDirector:send(c2s.ENDLESS_CLOISTER_REQ_ENDLESS_CLOISTER_INFO, {})
    TFDirector:send(c2s.DUNGEON_GROUP_MULTIPLE_REWARD, {})
    TFDirector:send(c2s.HERO_CHALLENGE_CHALLENGE_INFO, {})
    TFDirector:send(c2s.HERO_PRACTICE_PRACTICE_LEVEL_INFO, {})
    TFDirector:send(c2s.ODEUM_OPEN_PANEL, {})
    TFDirector:send(c2s.ODEUM_REQ_ODEUM_LEVEL_INFO, {})
    TFDirector:send(c2s.HERO_REQ_SIMULATE_TRAIN_INFO, {}) --模拟试炼信息
    TFDirector:send(c2s.DUNGEON_REQ_TIME_LINKAGE_INFO,{})
    local chapter = self:getChapter(EC_FBType.PLOT)
    local firstLevelCid = self:getChapterFirstLevel(chapter[1], EC_FBDiff.SIMPLE)
    firstLevelCid = 101101
    local levelCfg = self:getLevelCfg(firstLevelCid)
    local type_ = levelCfg.heroLimitType
    local isLimitHero = (type_ == EC_LimitHeroType.LIMIT_NJ or type_ == EC_LimitHeroType.LIMIT_J)
    if isLimitHero and not self:isPassPlotLevel(firstLevelCid) then
        TFDirector:send(c2s.DUNGEON_LIMIT_HERO_DUNGEON, {firstLevelCid})
        table.insert(waitList, s2c.DUNGEON_LIMIT_HERO_DUNGEON)
    end

    return waitList
end

function FubenDataMgr:onEnterMain()
    -- UserDefault键值
    local pid = MainPlayer:getPlayerId()
    self.KEY_FUBEN_SELECT_CHAPTER = string.format("key_%s_fuben_select_chapter", pid)
    self.KEY_FUBEN_SELECT_DIFF = string.format("key_%s_fuben_select_diff", pid)
    self.KEY_FUBEN_SELECT_LEVELGROUP = string.format("key_%s_fuben_select_levelgroup", pid)
    self.KEY_FUBEN_SELECT_FUBENTYPE = string.format("key_%s_fuben_select_fubentype", pid)
end

function FubenDataMgr:getChapterCfg(chapterId)
    if chapterId then
        return self.chapterMap_[chapterId]
    else
        return self.chapterMap_
    end
end

function FubenDataMgr:getActivityChapterIsOpen(chapterCid)
    local isOpen = false
    if chapterCid == EC_ActivityFubenType.TEAM then
        isOpen = true
    elseif chapterCid == EC_ActivityFubenType.ENDLESS then
        local endlessInfo = self:getEndlessInfo()
        isOpen = endlessInfo.step == EC_EndlessState.ING
    elseif chapterCid == EC_ActivityFubenType.KABALA then
        isOpen = KabalaTreeDataMgr:isFunctionOpen()
    elseif chapterCid == EC_ActivityFubenType.SPRITE then
        local funcIsOpen = FunctionDataMgr:isOpen(58)
        isOpen = self:getSpriteChallengeIsOpen() and funcIsOpen
    elseif chapterCid == EC_ActivityFubenType.SPRITE_EXTRA then
        local funcIsOpen = FunctionDataMgr:isOpen(59)
        isOpen = self:getSpriteExtraIsOpen() and funcIsOpen
    elseif chapterCid == EC_ActivityFubenType.TEAM_PVE then
        isOpen = TeamPveDataMgr:specialIsOpen()
    elseif chapterCid == EC_ActivityFubenType.BIG_WORLD then
        isOpen = true
    elseif chapterCid == EC_ActivityFubenType.SKYLADDER then
        isOpen = SkyLadderDataMgr:isOpen()
    elseif chapterCid == EC_ActivityFubenType.SIMULATION_TRIAL 
        or chapterCid == EC_ActivityFubenType.SIMULATION_TRIAL_2
        or chapterCid == EC_ActivityFubenType.SIMULATION_TRIAL_4  
        or chapterCid == EC_ActivityFubenType.SIMULATION_TRIAL_5  
        or chapterCid == EC_ActivityFubenType.SIMULATION_TRIAL_3 then --模拟试炼
        local funcIsOpen = FunctionDataMgr:isOpen(113)
        isOpen = self:getSimulationTrialIsOpen() and funcIsOpen
    end

    return isOpen
end

function FubenDataMgr:getChapter(fubenType, notSort)
    if fubenType then
        local data = {}
        local chapter = self.chapter_[fubenType]
        if fubenType == EC_FBType.DAILY then
            data = clone(self:getLevelGroup(chapter[1]))
            if not notSort then
                table.sort(data, function(a, b)
                       if self:getDailyIsOpen(a) == self:getDailyIsOpen(b) then
                           local cfgA = self.levelGroupMap_[a]
                           local cfgB = self.levelGroupMap_[b]
                           return cfgA.order < cfgB.order
                       end
                       return self:getDailyIsOpen(a)
                end)
            end
        elseif fubenType == EC_FBType.ACTIVITY then
            local openList = {}
            for i, v in ipairs(chapter) do
                if self:getActivityChapterIsOpen(v) then
                    openList[v] = 1
                else
                    openList[v] = 0
                end
            end
            data = clone(chapter)
            if not notSort then
                table.sort(data, function(a, b)
                               if openList[a] == openList[b] then
                                   local cfgA = self.chapterMap_[a]
                                   local cfgB = self.chapterMap_[b]
                                   return cfgA.order < cfgB.order
                               end
                               return openList[a] > openList[b]
                end)
            end
        else
            data = chapter
        end
        data = data or {}
        return data
    else
        return self.chapter_
    end
end

function FubenDataMgr:getDispatchLevel(dispatchType)
    local data = {}
    local chapter = {}
    if dispatchType == EC_DISPATCHType.DAILY then
        chapter = self.chapter_[EC_FBType.DAILY]
        local dailyData = clone(self:getLevelGroup(chapter[1]))
        for k,levelGroupId in pairs(dailyData) do
            if self:getDailyIsOpen(levelGroupId) then
                local levels = self:getLevel(levelGroupId)
                local topLevel = self:getDailyTopStarLevel(levelGroupId)
                if topLevel then
                    for i=#levels,1,-1 do
                        local levelCid = levels[i]
                        if topLevel == levelCid then
                            table.insert(data,levelCid)
                        end 
                    end
                end
            end
        end
    elseif dispatchType == EC_DISPATCHType.SPRITE then
        chapter = self.chapter_[EC_FBType.ACTIVITY]
        for i, v in ipairs(chapter) do
            if v == EC_ActivityFubenType.SPRITE then
                if self.spriteChallengeInfo_ and self.spriteChallengeInfo_.finishAny then
                    local levelCid = self:getCurSpriteLevelCid()
                    table.insert(data,levelCid)
                end
            end
        end
    elseif dispatchType == EC_DISPATCHType.THEATER then
        if self.theaterBossInfo_ and self.theaterBossInfo_.status ~= EC_TheaterStatus.CLOSING then
            if self.theaterBossInfo_.fightState then
                table.insert(data, self.theaterBossInfo_.bossDungeonId)
            end
        end
    elseif dispatchType == EC_DISPATCHType.TEAM then
        chapter = self.chapter_[EC_FBType.ACTIVITY]
        local levels = TeamFightDataMgr:getOpenLevels()
        for i,v in ipairs(levels) do
            if TeamFightDataMgr:checkLevelPassOver(v) then
                table.insert(data,v)
            end
        end
    end
    data = data or {}
    return data
end

function FubenDataMgr:getDailyTopStarLevel(levelGroupCid)
    local info = self.dailyMultipleInfo_[levelGroupCid]
    if info then
        return info.topStarsLevel
    end
end

function FubenDataMgr:getTheaterChapter( exChapterId )
    local exChapterId_ = exChapterId or TabDataMgr:getData("DiscreteData",46013).data.defaultSelect
    local theaterCfg = TabDataMgr:getData("ExtraChapter",exChapterId_)
    return theaterCfg.chapters, exChapterId_ 
end

function FubenDataMgr:getTheaterHardChapter( exChapterId )
    local exChapterId_ = exChapterId or TabDataMgr:getData("DiscreteData",46013).data.defaultSelect
    local theaterCfg = TabDataMgr:getData("ExtraChapter",exChapterId_)
    return theaterCfg.hardChapters , exChapterId_
end

function FubenDataMgr:getTheaterExtraChapter(chapterCid)
    local extraChapterMap = TabDataMgr:getData("ExtraChapter")
    local extraChapterCid
    for k, v in pairs(extraChapterMap) do
        local index = table.indexOf(v.chapters, chapterCid)
        if index ~= -1 then
            extraChapterCid = v.id
            break
        end
    end
    return extraChapterCid
end

function FubenDataMgr:getLevelCidBySite(levelGroupCid, diff, site)
    local level = self:getLevel(levelGroupCid, diff)
    local levelCid
    for i, v in ipairs(level) do
        local levelCfg = self:getLevelCfg(v)
        if levelCfg.positionOrder[1] == site then
            levelCid = v
            break
        end
    end
    return levelCid
end

function FubenDataMgr:getLevelGroup(chapterId)
    if chapterId then
        return self.levelGroup_[chapterId]
    else
        return self.levelGroup_
    end
end

function FubenDataMgr:getChapterOrderName(chapterCid)
    local chapterCfg = self:getChapterCfg(chapterCid)
    local chineseNumber = Utils:getChineseNumber(chapterCfg.orderName)
    local name = TextDataMgr:getText(300200, chineseNumber)
    return name
end

function FubenDataMgr:getChapterName(chapterCid)
    local chapterCfg = self:getChapterCfg(chapterCid)
    local name = TextDataMgr:getText(chapterCfg.name)
    local enName = TextDataMgr:getText(chapterCfg.nameEn)
    return name .. "-"..enName
end

function FubenDataMgr:getChapterFullName(chapterCid)
    local orderName = self:getChapterOrderName(chapterCid)
    local name = self:getChapterName(chapterCid)
    local fullName = TextDataMgr:getText(300231, orderName, name)
    return fullName
end

function FubenDataMgr:getLevelGroupCfg(levelGroupId)
    if levelGroupId then
        return self.levelGroupMap_[levelGroupId]
    else
        return self.levelGroupMap_
    end
end

function FubenDataMgr:getLevelGroupInfo(levelGroupId)
    return self.levelGroupInfo_[levelGroupId]
end

function FubenDataMgr:getLevel(levelGroupId, diff)
    local level = {}
    local levels = self.level_[levelGroupId]
    if levels then
        for i, v in ipairs(levels) do
            local levelCfg = self.levelMap_[v]
            if diff then
                if levelCfg.difficulty == diff then
                    table.insert(level, v)
                end
            else
                table.insert(level, v)
            end
        end
    end
    return level
end

function FubenDataMgr:getLevelName(levelCid)
    local levelCfg = self:getLevelCfg(levelCid)
    if levelCfg.dungeonType == EC_FBLevelType.NOOBSUMMON then
        return ""
    end
    if levelCfg.dungeonType == EC_FBLevelType.TXJZ then
        return TextDataMgr:getText(levelCfg.name)
    elseif levelCfg.dungeonType == EC_FBLevelType.HUNTER then
        return TextDataMgr:getText(levelCfg.name)
    end
    local levelGroupCfg = self:getLevelGroupCfg(levelCfg.levelGroupId)
    local chapterCfg = self:getChapterCfg(levelGroupCfg.dungeonChapterId)
    local name = ""
    if chapterCfg.type == EC_FBType.THEATER or chapterCfg.type == EC_FBType.THEATER_HARD then
        local theaterLevelCfg = self:getTheaterDungeonLevelCfg(levelCid)
        name = TextDataMgr:getText(theaterLevelCfg.storydungeonName)
    elseif chapterCfg.type == EC_FBType.HOLIDAY then
        if levelCfg.name ~= 0 then
            name = TextDataMgr:getText(levelCfg.name)
        end
    elseif chapterCfg.type == EC_FBType.PLOT then
        name = self.levelName_[levelCid]
    else
        if levelCfg.name ~= 0 then
            name = TextDataMgr:getText(levelCfg.name)
        end
    end
    return name
end

function FubenDataMgr:getAllLevelName(levelName)
    return self.levelName_
end

function FubenDataMgr:getLevelCfg(levelId)
    return self.levelMap_[levelId]
end

function FubenDataMgr:getLevelInfo(levelId)
    return self.levelInfo_[levelId]
end

function FubenDataMgr:getMainScenario(scriptId)
    if scriptId then
        return self.mainScenario_[scriptId]
    else
        return self.mainScenario_
    end
end

function FubenDataMgr:getMainScenarioCfg(mainScenarioId)
    if mainScenarioId then
        return self.mainScenarioMap_[mainScenarioId]
    else
        return self.mainScenarioMap_
    end
end

function FubenDataMgr:getFightCount(levelCid)
    local fightCount = 0
    local levelInfo = self:getLevelInfo(levelCid)
    if levelInfo then
        fightCount = levelInfo.fightCount
    end
    return fightCount
end

function FubenDataMgr:isPassPlotChapter(chapterId)
    local isPass = true
    local levelGroup = self:getLevelGroup(chapterId)
    for i, v in ipairs(levelGroup) do
        isPass = self:isPassPlotLevelGroup(v, EC_FBDiff.SIMPLE)
        if not isPass then
            break
        end
    end
    return isPass
end

function FubenDataMgr:isPassPlotLevel(levelCid)
    local levelInfo = self.levelInfo_[levelCid]
    local isPass = tobool(levelInfo and levelInfo.win)
    return isPass
end

function FubenDataMgr:isPassPlotLevelGroup(levelGroupId, diff)
    local levelGroupCfg = self.levelGroupMap_[levelGroupId]
    local isPass = true
    if levelGroupCfg.dungeonType == EC_FBLevelGroupType.NORMAL 
    or levelGroupCfg.dungeonType == EC_FBLevelGroupType.LINKAGE then
        local level = self:getLevel(levelGroupId, diff)
        for i, v in ipairs(level) do
            local levelCfg = self:getLevelCfg(v)
            if not levelCfg.isFree then
                isPass = self:isPassPlotLevel(v)
            end
            if not isPass then
                break
            end
        end
    end

    return isPass
end

function FubenDataMgr:getChapterFirstLevel(chapterCid, diff)
    local levelGroup = self:getLevelGroup(chapterCid)
    local levelCid
    if levelGroup[1] then
        local level = self:getLevel(levelGroup[1], diff)
        levelCid = level[1]
    end
    return levelCid
end

function FubenDataMgr:checkPlotChapterEnabled(chapterCid, diff)
    local enabled = false
    local firstLevelCid = self:getChapterFirstLevel(chapterCid, diff)
    if firstLevelCid then
        enabled = self:checkPlotLevelEnabled(firstLevelCid)
    end
    return enabled
end

function FubenDataMgr:getNextPlotChapterCid(chapterCid)
    local chapterCfg = self:getChapterCfg(chapterCid)
    local chapter = self:getChapter(EC_FBType.PLOT)
    local index = table.indexOf(chapter, chapterCid)
    local nextChapterCid = nil
    if index ~= -1 and chapter[index + 1] then
        nextChapterCid = chapter[index + 1]
    end
    return nextChapterCid
end

function FubenDataMgr:getPrePlotChapterCid(chapterCid)
    local chapterCfg = self:getChapterCfg(chapterCid)
    local chapter = self:getChapter(EC_FBType.PLOT)
    local index = table.indexOf(chapter, chapterCid)
    local preChapterCid = nil
    if index ~= -1 and chapter[index - 1] then
        preChapterCid = chapter[index - 1]
    end
    return preChapterCid
end

function FubenDataMgr:checkNextPlotChapterEnabled(chapterCid)
    local chapterCfg = self:getChapterCfg(chapterCid)
    local enabled = false
    if chapterCfg.type == EC_FBType.PLOT then
        local nextChapterCid = self:getNextPlotChapterCid(chapterCid)
        if nextChapterCid then
            enabled = self:checkPlotChapterEnabled(nextChapterCid)
        end
    end
    return enabled
end

function FubenDataMgr:checkPlotLevelGroupEnabled(levelGroupId)
    local levelGroupCfg = self.levelGroupMap_[levelGroupId]
    local enabled = true
    local preLevelGroupId = levelGroupCfg.preDungeonId
    if preLevelGroupId ~= 0 then
        if levelGroupCfg.preType == 1 then
            enabled = self:isPassPlotLevelGroup(preLevelGroupId, EC_FBDiff.SIMPLE)
        elseif levelGroupCfg.preType == 2 then
            enabled = self:isPassPlotLevel(preLevelGroupId)
        end
    end
    return enabled
end

function FubenDataMgr:checkPlotLevelEnabled(levelId)
    local enabled = false
    local levelIsOpen = false
    local preIsOpen = false
    if self:isPassPlotLevel(levelId) then
        enabled = true
        levelIsOpen = true
        preIsOpen = true
    else
        local levelCfg = self:getLevelCfg(levelId)
        preIsOpen = true
        local preLevelId = levelCfg.preLevelId
        for i, v in ipairs(preLevelId) do
            preIsOpen = preIsOpen and self:isPassPlotLevel(v)
            if not preIsOpen then
                break
            end
        end
        levelIsOpen = MainPlayer:getPlayerLv() >= levelCfg.playerLv
        enabled = preIsOpen and levelIsOpen
    end
    return enabled, preIsOpen, levelIsOpen
end

function FubenDataMgr:checkPlotDiffEnabled(diff)
    local chapter = self:getChapter(EC_FBType.PLOT)
    local levelGroup = self:getLevelGroup(chapter[1])
    local plotLevelGroupId
    for i, v in ipairs(levelGroup) do
        local levelGroupCfg = self:getLevelGroupCfg(v)
        if levelGroupCfg.dungeonType == EC_FBLevelType.NORMAL then
            plotLevelGroupId = v
            break
        end
    end

    local level = self:getLevel(plotLevelGroupId, diff)
    local enabled = false
    for i, v in ipairs(level) do
        if self:checkPlotLevelEnabled(v) then
            enabled = true
            break
        end
    end
    return enabled
end

function FubenDataMgr:getStarRuleDesc(levelId, pos)
    local levelCfg = self.levelMap_[levelId]
    local desc = ""
    if levelCfg.dungeonType == EC_FBLevelType.FIGHTING or levelCfg.dungeonType == EC_FBLevelType.THEATER_FIGHTING or levelCfg.dungeonType == EC_FBLevelType.KUANGSAN_FIGHTING then
        local starParam = levelCfg.starParam
        local starRule = levelCfg.starType
        local rule = starRule[pos]
        local starDesc = EC_FBStarRuleStr[rule]
        if rule == EC_FBStarRule.PASS then
            desc = TextDataMgr:getText(starDesc)
        elseif rule == EC_FBStarRule.HERO_BATTLE then
            local heroCfg = TabDataMgr:getData("Hero", starParam[pos])
            local name = TextDataMgr:getText(heroCfg.name)
            desc = TextDataMgr:getText(starDesc, name)
        else
            desc = TextDataMgr:getText(starDesc, starParam[pos])
        end
        return desc
    elseif levelCfg.dungeonType == EC_FBLevelType.DATING or levelCfg.dungeonType == EC_FBLevelType.THEATER_DATING or levelCfg.dungeonType == EC_FBLevelType.KUANGSAN_DATING then
        pos = 1
        local datingID = levelCfg.datingID[#levelCfg.datingID]
        if datingID then
            local datingRuleCfg = TabDataMgr:getData("DatingRule", datingID)
            desc = TextDataMgr:getText(datingRuleCfg.dungeonDateDes[pos])
        end
    elseif levelCfg.dungeonType == EC_FBLevelType.CITYDATING then
        local starDesc = levelCfg.starDescribe
        desc = TextDataMgr:getText(starDesc[1])
    end
    return desc
end

function FubenDataMgr:getPassCondDesc(levelId, pos)
    local levelCfg = self.levelMap_[levelId]
    local type_ = levelCfg.victoryType[pos]
    local param = levelCfg.victoryParam[pos]
    local descId = levelCfg.victoryTypeDescribe[pos]
    local desc = ""
    if type_ == EC_LevelPassCond.DESTORY then
        desc = TextDataMgr:getText(descId)
    elseif type_ == EC_LevelPassCond.SURVIVAL
        or type_ == EC_LevelPassCond.SURVIVAL_HURT then
        desc = TextDataMgr:getText(descId, param[1])
    elseif type_ == EC_LevelPassCond.SPECIFICID then
        local monsterCfg = TabDataMgr:getData("Monster", param[1])
        local monsterName = TextDataMgr:getText(monsterCfg.name)
        if param[2] > 1 then
            desc = TextDataMgr:getText(descId, param[2], monsterName)
        else
            descId = 300807
            desc = TextDataMgr:getText(descId, monsterName)
        end
    elseif type_ == EC_LevelPassCond.SPECIFICTYPE then
        local monsterTypeName = TextDataMgr:getText(EC_MonsterTypeName[param[1]])
        desc = TextDataMgr:getText(descId, param[2], monsterTypeName)
    elseif type_ == EC_LevelPassCond.SPECIFICCOUNT then
        desc = TextDataMgr:getText(descId, param[1])
    elseif type_ == EC_LevelPassCond.LIMIT_TIME_KILL then -- 限时杀怪
        desc = TextDataMgr:getText(descId, param[1])
    elseif type_ == EC_LevelPassCond.COMBO_COUNT then -- 连击数
        desc = TextDataMgr:getText(descId, param[1])
    else
        desc = TextDataMgr:getText(descId)
    end
    --TODO 特殊关卡显示描述处理
    if levelId ~= 710006 and levelCfg.time > 0 and type_ ~= EC_LevelPassCond.SURVIVAL then
        local timeStr = TextDataMgr:getText(300825, levelCfg.time)
        if GAME_LANGUAGE_VAR == "" then
            desc = timeStr .. desc
        else
            desc = timeStr .." ".. desc
        end
        
    end
    return desc
end

function FubenDataMgr:judgeStarIsActive(levelCid, pos, isReal)
    local levelInfo = self:getLevelInfo(levelCid)
    local levelCfg = self:getLevelCfg(levelCid)
    local isDaily = false
    for k, v in pairs(EC_DailyType) do
        if v == levelCfg.levelGroupId then
            isDaily = true
            break
        end
    end
    local isReach = false
    if levelInfo and (not isDaily or isReal) then
        local goals = levelInfo.goals or {}
        local index = table.indexOf(goals, pos)
        isReach = (index ~= -1)
    end
    return isReach
end

function FubenDataMgr:cacheSelectChapter(chapterCid)
    UserDefault:setStringForKey(self.KEY_FUBEN_SELECT_CHAPTER, tostring(chapterCid))
    self.selectChapter_ = chapterCid
end

function FubenDataMgr:getCacheSelectChapter()
    if not self.selectChapter_ then
        local selectChapter = UserDefault:getStringForKey(self.KEY_FUBEN_SELECT_CHAPTER)
        if selectChapter and #selectChapter > 0 then
            self.selectChapter_ = tonumber(selectChapter)
        end
    end
    return self.selectChapter_
end

function FubenDataMgr:cacheSelectLevel(levelCid)
    self.selectLevel_ = levelCid
end

function FubenDataMgr:getCacheSelectLevel()
    return self.selectLevel_
end

function FubenDataMgr:cacheSelectDiff(diff)
    UserDefault:setStringForKey(self.KEY_FUBEN_SELECT_DIFF, tostring(diff))
end

function FubenDataMgr:getCacheSelectDiff()
    local diff = UserDefault:getStringForKey(self.KEY_FUBEN_SELECT_DIFF)
    if diff and #diff > 0 then
        diff = tonumber(diff)
    else
        diff = nil
    end
    return diff
end

function FubenDataMgr:cacheSelectLevelGroup(levelGroupCid)
    UserDefault:setStringForKey(self.KEY_FUBEN_SELECT_LEVELGROUP, tostring(levelGroupCid))
    self.selectLevelGroup_ = levelGroupCid
end

function FubenDataMgr:getCacheSelectLevelGroup()
    if not self.selectLevelGroup_ then
        local selectLevelGroup = UserDefault:getStringForKey(self.KEY_FUBEN_SELECT_LEVELGROUP)
        if selectLevelGroup and #selectLevelGroup > 0 then
            self.selectLevelGroup_ = tonumber(selectLevelGroup)
        end
    end
    return self.selectLevelGroup_
end

function FubenDataMgr:cacheSelectFubenType(fubenType)
    UserDefault:setStringForKey(self.KEY_FUBEN_SELECT_FUBENTYPE, tostring(fubenType))
    self.selectFubenType_ = fubenType
end

function FubenDataMgr:getCacheSelectFubenType()
    if not self.selectFubenType_ then
        local selectFubenType = UserDefault:getStringForKey(self.KEY_FUBEN_SELECT_FUBENTYPE)
        if selectFubenType and #selectFubenType > 0 then
            self.selectFubenType_ = tonumber(selectFubenType)
        end
    end
    return self.selectFubenType_
end

function FubenDataMgr:getLevelGroupStarNum(levelGroupId, diff)
    local fightStarNum = 0
    local datingStarNum = 0
    local levelGroupCfg = self:getLevelGroupCfg(levelGroupId)
    for k, v in pairs(self.levelInfo_) do
        local levelCfg = self:getLevelCfg(k)
        if levelCfg and levelCfg.difficulty == diff and levelCfg.levelGroupId == levelGroupId and v.win and v.goals then
            if levelCfg.dungeonType == EC_FBLevelType.FIGHTING or levelCfg.dungeonType == EC_FBLevelType.THEATER_FIGHTING or levelCfg.dungeonType == EC_FBLevelType.KUANGSAN_FIGHTING then
                fightStarNum = fightStarNum + self:getStarNum(k)
            else
                datingStarNum = datingStarNum + self:getStarNum(k)
            end
        end
    end
    return fightStarNum, datingStarNum
end

function FubenDataMgr:getLevelGroupTotalStarNum(levelGroupCid, diff)
    local level = self:getLevel(levelGroupCid, diff)
    local fightStarNum = 0
    local datingStarNum = 0
    for i, v in ipairs(level) do
        local levelCfg = self:getLevelCfg(v)
        if levelCfg.dungeonType == EC_FBLevelType.FIGHTING or levelCfg.dungeonType == EC_FBLevelType.THEATER_FIGHTING or levelCfg.dungeonType == EC_FBLevelType.KUANGSAN_FIGHTING then
            fightStarNum = fightStarNum + math.min(maxStarLimit,#levelCfg.starType)
        else
            -- local datingRuleCid = levelCfg.datingID[#levelCfg.datingID]
            -- if datingRuleCid then
            --     local datingRuleCfg = TabDataMgr:getData("DatingRule", datingRuleCid)
            --     datingStarNum = datingStarNum + #datingRuleCfg.dungeonDateHeart
            -- end
        end
    end
    return fightStarNum, datingStarNum
end

function FubenDataMgr:getChapterTotalStarNum(chapterCid, diff)
    local levelGroup = self:getLevelGroup(chapterCid)
    local fightStarNum = 0
    local datingStarNum = 0
    for i, v in ipairs(levelGroup) do
        local foo, bar = self:getLevelGroupTotalStarNum(v, diff)
        fightStarNum = fightStarNum + foo
        datingStarNum = datingStarNum + bar
    end
    return fightStarNum, datingStarNum
end

function FubenDataMgr:getChapterStarNum(chapterCid, diff)
    local levelGroup = self:getLevelGroup(chapterCid)
    local fightStarNum = 0
    local datingStarNum = 0
    for i, v in ipairs(levelGroup) do
        local foo, bar = self:getLevelGroupStarNum(v, diff)
        fightStarNum = fightStarNum + foo
        datingStarNum = datingStarNum + bar
    end
    return fightStarNum, datingStarNum
end

function FubenDataMgr:canGetLevelGroupStarReward(levelGroupId, diff, id)
    local levelGroupCfg = self:getLevelGroupCfg(levelGroupId)
    local cond = levelGroupCfg.reward[diff][id].cond
    local fightStarNum, datingStarNum = self:getChapterStarNum(levelGroupCfg.dungeonChapterId, diff)
    return fightStarNum >= cond[1] and datingStarNum >= cond[2]
end

function FubenDataMgr:checkChapterStarRewardCanReceive(chapterCid, diff)
    local levelGroup = self:getLevelGroup(chapterCid)
    local levelGroupCid = levelGroup[1]
    local levelGroupCfg = self:getLevelGroupCfg(levelGroupCid)
    local diffReward = levelGroupCfg.reward[diff] or {}
    local stars = table.keys(diffReward)
    local canReceive = false
    local isReceiveAll = true
    for i, v in ipairs(stars) do
        local isGet = self:checkLevelGroupStarRewardIsGet(levelGroupCid, diff, v)
        local isReach = self:canGetLevelGroupStarReward(levelGroupCid, diff, v)
        if not isGet then
            if isReach then
                canReceive = true
            else
                isReceiveAll = false
            end
        end
    end
    return canReceive, isReceiveAll
end

function FubenDataMgr:checkLevelGroupStarRewardIsGet(levelGroupId, diff, id)
    local levelGroupInfo = self:getLevelGroupInfo(levelGroupId)
    local isGet = false
    if levelGroupInfo and levelGroupInfo.rewardInfo then
        local rewardInfo = levelGroupInfo.rewardInfo[diff]
        if rewardInfo then
            local index = table.indexOf(rewardInfo, id)
            isGet = (index ~= -1)
        end
    end
    return isGet
end

function FubenDataMgr:getDailyIsOpen(levelGroupCid)
    local addhours = Utils:getKVP(15001, "time")
    local levelCfg = self:getLevelGroupCfg(levelGroupCid)
    local date = os.date("*t" , ServerDataMgr:customUtcTimeForServerTimestap() - addhours * 3600 )
    local weekday = date.wday
    local index = table.indexOf(levelCfg.timeFrame, weekday)
    isOpen = index ~= -1
    return isOpen
end

function FubenDataMgr:getSpriteChallengeIsOpen()
    local isOpen = false
    if self.spriteChallengeInfo_ and self.spriteChallengeInfo_.levels then
        isOpen = (#self.spriteChallengeInfo_.levels > 0)
    end
    return isOpen
end

function FubenDataMgr:getDailyOpenTime(levelGroupCid)
    local addhours = Utils:getKVP(15001, "time")
    local levelGroupCfg = self:getLevelGroupCfg(levelGroupCid)
    local date = os.date("*t" , ServerDataMgr:customUtcTimeForServerTimestap()  - addhours * 3600 )
    local weekday = date.wday
    local openWeekday = clone(levelGroupCfg.timeFrame) or {}
    table.sort(openWeekday)
    local year, month, day = date.year , date.month , date.day
    local index = table.indexOf(openWeekday, weekday)
    local endDate
    if index == -1 then
        local addDays = 1
        local day = weekday
        local i = 1
        while true do
            day = day + 1
            if day > 7 then
                day = 1
            end
            if table.indexOf(openWeekday, day) == -1 then
                addDays = addDays + 1
            else
                break
            end
        end
        endDate = 24*addDays * 3600 - date.hour * 3600 - date.min * 60 - date.sec
    else
        endDate = 24* 3600 - date.hour * 3600 - date.min * 60 - date.sec
    end
    local timestamp = endDate
    return timestamp
end

function FubenDataMgr:getDailyExpirationTime(levelGroupCid)
    local addhours = Utils:getKVP(15001, "time")
    local levelGroupCfg = self:getLevelGroupCfg(levelGroupCid)
    local date = os.date("*t" , ServerDataMgr:customUtcTimeForServerTimestap()  - addhours * 3600 )
    local weekday = date.wday
    local openWeekday = clone(levelGroupCfg.timeFrame) or {}
    table.sort(openWeekday)
    local index = table.indexOf(openWeekday, weekday)
    local endDate
     if index ~= -1 then
        local addDays = 1
        local day = weekday
        local i = index
        while true do
            day = day + 1
            i = i + 1
            if day > 7 then
                day = 1
                i = 1
            end
            if day == openWeekday[i] then
                addDays = addDays + 1
            else
                break
            end
        end
        endDate = 24*addDays * 3600 - date.hour * 3600 - date.min * 60 - date.sec
    else
        endDate = 24* 3600 - date.hour * 3600 - date.min * 60 - date.sec
    end
    local timestamp = endDate
    return timestamp
end

function FubenDataMgr:getPlotLevelRemainFightCount(levelCid)
    local levelCfg = self:getLevelCfg(levelCid)
    local levelInfo = self:getLevelInfo(levelCid)
    local remainCount = levelCfg.fightCount
    if levelInfo and levelInfo.fightCount then
        local buyCount = levelInfo.buyCount or 0
        remainCount = math.max(0, levelCfg.fightCount + buyCount - levelInfo.fightCount)
    end
    return remainCount
end

function FubenDataMgr:getDailyRemainFightCount(levelGroupId)
    local levelGroupInfo = self:getLevelGroupInfo(levelGroupId)
    local levelGroupCfg = self:getLevelGroupCfg(levelGroupId)
    local remainCount = levelGroupCfg.countLimit
    if levelGroupInfo and levelGroupInfo.fightCount then
        local buyCount = levelGroupInfo.buyCount or 0
        remainCount = math.max(0, levelGroupCfg.countLimit + buyCount - levelGroupInfo.fightCount)
    end
    return remainCount
end

function FubenDataMgr:getDailyRemainBuyCount(levelGroupId)
    local levelGroupInfo = self:getLevelGroupInfo(levelGroupId)
    local levelGroupCfg = self:getLevelGroupCfg(levelGroupId)
    local remainCount = levelGroupCfg.buyCountLimit
    if levelGroupInfo and levelGroupInfo.buyCount then
        remainCount = math.max(0, levelGroupCfg.buyCountLimit - levelGroupInfo.buyCount)
    end
    return remainCount
end

function FubenDataMgr:getPlotLevelRemainBuyCount(levelCid)
    local levelCfg = self:getLevelCfg(levelCid)
    local levelInfo = self:getLevelInfo(levelCid)
    local remainCount = levelCfg.buyLimit
    if levelInfo and levelInfo.buyCount then
        remainCount = math.max(0, levelCfg.buyLimit - levelInfo.buyCount)
    end
    return remainCount
end

function FubenDataMgr:getActivityState(chapterCid)
    local state, stateStrCid
    if chapterCid == 401 then
        local endlessInfo = self:getEndlessInfo()
        state = endlessInfo.step
        stateStrCid = EC_EndlessStateStr[state]
    elseif chapterCid == 402 then
        state = true
        isopen = TeamFightDataMgr:isTeamFubenOpenning()
        if isopen == true then
            stateStrCid = 2100020
        else
            stateStrCid = 2100019
        end
    end
    return state, stateStrCid
end

function FubenDataMgr:openChapter(chapterCid)
    if not chapterCid then return end

    local chapterCfg = self:getChapterCfg(chapterCid)
    if chapterCfg.unlockLevel <= MainPlayer:getPlayerLv() then
        if chapterCid == 401 then
            Utils:openView("fuben.FubenActivityView", chapterCid)
        elseif chapterCid == 402 then
            if TeamFightDataMgr:openTeamGroupSelView(chapterCid) == false then
                local view = AlertManager:getLayer(-1)
                if view and view.__cname == "FubenChapterView" then
                else
                    Utils:openView("fuben.FubenChapterView")
                end
            end
        else
            Utils:openView("fuben.FubenLevelView", chapterCid)
        end
    else
        Utils:showTips(202016, chapterCfg.unlockLevel)
    end
end

function FubenDataMgr:openFuben()
    AlertManager:closeAll()
    Utils:openView("fuben.FubenChapterView")
    if self.selectFubenType_ then
        if self.selectFubenType_ == EC_FBType.PLOT then
            if self.selectChapter_ and self.selectLevel_ then
                Utils:openView("fuben.FubenLevelView", self.selectChapter_, self.selectLevel_)
            end
        elseif self.selectFubenType_ == EC_FBType.ACTIVITY then
            if self.selectChapter_ == EC_ActivityFubenType.ENDLESS then
                local endlessInfo = self:getEndlessInfo()
                if endlessInfo.step == EC_EndlessState.ING then
                    Utils:openView("fuben.FubenEndlessView", self.selectChapter_)
                elseif endlessInfo.step == EC_EndlessState.CLEARING then
                    Utils:showTips(300877)
                end
            elseif self.selectChapter_ == EC_ActivityFubenType.TEAM then
                TeamFightDataMgr:openTeamGroupSelView(self.selectChapter_)
            elseif self.selectChapter_ == EC_ActivityFubenType.SPRITE then
                if self:getSpriteChallengeIsOpen() then
                    Utils:openView("fuben.FubenSpriteView", self.selectChapter_)
                end
            elseif self.selectChapter_ == EC_ActivityFubenType.KABALA then
                Utils:openView("kabalaTree.KabalaTreeMainView")
                local curWorldId = KabalaTreeDataMgr:getCurWorldId()
                if curWorldId then
                    Utils:openView("kabalaTree.KabalaTreeExploreView",curWorldId)
                end
            elseif self.selectChapter_ == EC_ActivityFubenType.SPRITE_EXTRA then
                local funcIsOpen = FunctionDataMgr:checkFuncOpen(59)
                if funcIsOpen then
                    if self:getSpriteExtraIsOpen() then
                        --精灵模拟试练
                        Utils:openView("fuben.FubenSpriteExtraView", self.selectChapter_)
                    end
                end
            end
        elseif self.selectFubenType_ == EC_FBType.DAILY then
            Utils:openView("fuben.FubenDailyView", self.selectLevelGroup_)
        elseif self.selectFubenType_ == EC_FBType.HOLIDAY then
            if self.selectChapter_ == EC_ActivityFubenType.HALLOWEEN then
                Utils:openView("fuben.FubenHalloweenView", self.selectChapter_)
            elseif self.selectChapter_ == EC_ActivityFubenType.CHRISTMAS then
                AgoraDataMgr:openAgoraMain()
            end
        elseif self.selectFubenType_ == EC_FBType.THEATER then
            Utils:openView("fuben.FubenTheaterLevelView", self.selectChapter_, self.selectLevel_,self.extraChapterId_)
        elseif self.selectFubenType_ == EC_FBType.LINKAGE then
            Utils:openView("linkage.LinkageView",self.selectChapter_) 
        end
    end
end

function FubenDataMgr:getUnlockNextChapterCid()
    return self.unlockNextChapterCid_
end

function FubenDataMgr:setUnlockNextChapterCid(chapterCid)
    self.unlockNextChapterCid_ = chapterCid
end

function FubenDataMgr:getEndlessInfo()
    return self.endlessInfo_
end

function FubenDataMgr:getEndlessHeroHpPercent(heroCid)
    local percent = 10000
    local heroHealth = self.endlessInfo_.heroHealth
    if heroHealth and heroHealth.heroHealth then
        for i, v in ipairs(heroHealth.heroHealth) do
            if v.heroCid == heroCid then
                percent = v.health
                break
            end
        end
    end
    return percent
end

function FubenDataMgr:getEndlessCloisterLevel(weekNum)
    return self.endlessCloisterLevel_[weekNum]
end

function FubenDataMgr:getEndlessCloisterLevelCfg(cid)
    return self.endlessCloisterLevelMap_[cid]
end

function FubenDataMgr:getEndlessMaxLevel()
    local maxLevel = Utils:getKVP(11002, "maxLevel")
    return maxLevel
end

function FubenDataMgr:getEndlessNormalMaxLevel()
    local normalMaxLevel = Utils:getKVP(11002, "normalLevel")
    return normalMaxLevel
end

function FubenDataMgr:isEndlessRacingMode(levelCid)
    local endlessCfg = self:getEndlessCloisterLevelCfg(levelCid)
    local normalMaxLevel = self:getEndlessNormalMaxLevel()
    return endlessCfg.order > normalMaxLevel
end

function FubenDataMgr:getStarNum(levelCid)
    local starNum = 0
    local levelInfo = self:getLevelInfo(levelCid)
    if levelInfo then
        for i = 1,maxStarLimit do
            levelInfo.goals = levelInfo.goals or {}
            if table.indexOf(levelInfo.goals,i) ~= -1 then
                starNum = starNum + 1
            end
        end
    end
    return starNum
end

function FubenDataMgr:getLevelFormation(levelCid)
    return self.levelFormation_[levelCid]
end

function FubenDataMgr:resetLevelFormation(levelCid)
    self.levelFormation_[levelCid] = clone(self.originLevelFormation_[levelCid])
end

function FubenDataMgr:addLevelFormation(levelCid, pid)
    local stance = self.levelFormation_[levelCid].stance
    table.insert(stance, tostring(pid))
end

function FubenDataMgr:removeLevelFormation(levelCid, pid)
    local stance = self.levelFormation_[levelCid].stance
    for i, v in ipairs(stance) do
        if v == tostring(pid) then
            table.remove(stance, i)
            break
        end
    end
end

function FubenDataMgr:casLevelFormation(levelCid, oldPid, newPid)
    local stance = self.levelFormation_[levelCid].stance
    for i, v in ipairs(stance) do
        if v == tostring(oldPid) then
            stance[i] = tostring(newPid)
            break
        end
    end
end

function FubenDataMgr:moveLevelFormation(levelCid, formIndex, toIndex)
    local stance = self.levelFormation_[levelCid].stance
    stance[formIndex], stance[toIndex] = stance[toIndex], stance[formIndex]
end

function FubenDataMgr:getLimitHero(limitHeroCid)
    return self.limitHeros_[limitHeroCid]
end

function FubenDataMgr:getAssistHero()
    local hero
    for i = #self.assistantData_, 1, -1 do
        hero = self.assistantData_[i]
        if FriendDataMgr:isFriend(hero.pid) then
            table.remove(self.assistantData_, i)
            hero = nil
        else
            break
        end
    end
    return hero
end

function FubenDataMgr:popAssistHero(pid)
    for i = #self.assistantData_, 1, -1 do
        local hero = self.assistantData_[i]
        if hero.pid == pid then
            table.remove(self.assistantData_, i)
            break
        end
    end
end

function FubenDataMgr:getCurLevelCid()
    return self.curLevelCid_
end

function FubenDataMgr:setFormation(formation)
    self.formation_ = formation
end

function FubenDataMgr:cachePlayerInfo()
    self.playerInfo_ = {
        level = MainPlayer:getPlayerLv(),
        exp = MainPlayer:getPlayerExp(),
        percent = MainPlayer:getExpProgress(),
    }
end

function FubenDataMgr:cacheExtraChapterId( extraChapterId )
    self.extraChapterId_ = extraChapterId
end

function FubenDataMgr:getCachePlayerInfo()
    return self.playerInfo_
end

function FubenDataMgr:getFormation()
    return self.formation_
end

function FubenDataMgr:getFubenType(levelCid)
    local levelCfg = self:getLevelCfg(levelCid)
    local levelGroupCfg = self:getLevelGroupCfg(levelCfg.levelGroupId)
    local chapterCfg = self:getChapterCfg(levelGroupCfg.dungeonChapterId)
    return chapterCfg.type
end

function FubenDataMgr:getEndlessJumpLevel(sec)
    local jumpLevelCfg = Utils:getKVP(11001, "skipLevels")
    local jumpLevel = 0
    for i, v in ipairs(jumpLevelCfg) do
        if sec >= v.min and sec <= v.max then
            jumpLevel = v.level
            break
        end
    end
    return jumpLevel
end

function FubenDataMgr:getLevelGroupServerId(levelGroupCid, diff)
    local level = self:getLevel(levelGroupCid, diff)
    local levelGroupServerID
    for i, v in ipairs(level) do
        local levelCfg = self:getLevelCfg(v)
        levelGroupServerID = levelCfg.levelGroupServerID
        if levelGroupServerID then
            break
        end
    end
    return levelGroupServerID
end

function FubenDataMgr:getDailyMultiple(levelGroupCid)
    local info = self.dailyMultipleInfo_[levelGroupCid]
    local multiple = 1
    if info then
        multiple = tonumber(info.multiple)
    end
    return multiple
end

function FubenDataMgr:makeFormationData(heroData, type_, id)
    return {
        data = heroData,
        type = type_,
        id = id,
    }
end

function FubenDataMgr:enterFirstPlotLevel()
    local chapter = self:getChapter(EC_FBType.PLOT)
    local firstLevelCid = self:getChapterFirstLevel(chapter[1], EC_FBDiff.SIMPLE)
    firstLevelCid = 101101
    local isEntry = false
    if not self:isPassPlotLevel(firstLevelCid) then
        isEntry = true
        local levelCfg = self:getLevelCfg(firstLevelCid)
        local levelGroupCfg = self:getLevelGroupCfg(levelCfg.levelGroupId)
        local chapterCfg = self:getChapterCfg(levelGroupCfg.dungeonChapterId)
        self:cacheSelectFubenType(chapterCfg.type)
        self:cacheSelectChapter(levelGroupCfg.dungeonChapterId)
        self:cacheSelectLevel(firstLevelCid)
        local formationData = self:getInitFormation(firstLevelCid)
        HeroDataMgr:changeDataByFuben(firstLevelCid, formationData)
        local heros = {}
        for i, v in ipairs(formationData) do
            table.insert(heros, {v.type, v.id})
        end
        local battleController = require("lua.logic.battle.BattleController")
        battleController.requestFightStart(firstLevelCid, 0, 0, heros, 0, false)
    end
    return isEntry
end

--返回角色额外的skinIDs[灵装试用功能]
local function availableSkinIDS(heroCid)
    local _cfgs = TabDataMgr:getData("TrialHeroSkin")
    local skinIds = {}
    for k,v in pairs(_cfgs) do
        if v.fitting and v.matchHero == heroCid then
            table.insert(skinIds,v.id)
        end
    end
    return skinIds
end
--转换SkinCid
local function tansSkinCid( skinCid )
    local _cfgs = TabDataMgr:getData("TrialHeroSkin")
    for k,v in pairs(_cfgs) do
        if v.matchSkin == skinCid or v.id == skinCid then
            return v.id
        end
    end
    Box("not exist TrialHeroSkin skinCid:" ..tostring(skinCid))
end
function FubenDataMgr:enterPracticeLevel(heroCid,skinCid)
    local checkExtId = TFAssetsManager:getCheckInfo(5,nil)
    if checkExtId then
        TFAssetsManager:downloadAssetsOfFunc(checkExtId,function()
            local formationData = self:getFormationByHero(heroCid)
            local heros = {}
            for i, v in ipairs(formationData) do
                skinCid = skinCid or v.data.skinCid
                skinCid = tansSkinCid(skinCid)
                local skinIds = availableSkinIDS(v.data.cid)
                for i, skinId in ipairs(skinIds) do
                    if skinId == skinCid then 
                        table.insert(heros, 1 ,{limitType = v.type, limitCid = v.id, skinCid = skinId})
                    else
                        table.insert(heros, {limitType = v.type, limitCid = v.id, skinCid = skinId})
                    end
                end
            end
            self:setFormation(formationData)
            local battleController = require("lua.logic.battle.BattleController")
            battleController.enterBattle(
                {
                    levelCid = 102,
                    limitHeros = heros,
                    isDuelMod = false,
                },
                EC_BattleType.COMMON
            )
        end,true)
    end  
end

function FubenDataMgr:getInitFormation(levelCid)
    local isLimitHero = false
    local isDisableHero = false
    local isLimitSimulationTrialHero = false
    local isContainSimulationTrial = false
    if levelCid then
        local levelCfg = self:getLevelCfg(levelCid)
        local type_ = levelCfg.heroLimitType
        isLimitHero = (type_ == EC_LimitHeroType.LIMIT_NJ or type_ == EC_LimitHeroType.LIMIT_J)
        isDisableHero = (type_ == EC_LimitHeroType.DISABLE)
        isLimitSimulationTrialHero = (type_ ==  EC_LimitHeroType.SIMULATION_TRIAL_LOCK or type_ ==  EC_LimitHeroType.SIMULATION_TRIAL)    -- 限定 试炼精灵
        --是否包含试炼精灵
        isContainSimulationTrial = tobool(levelCfg.limitDungeon == 1)
    end
    local formationData = {}
    if isLimitHero then
        local levelCfg = self:getLevelCfg(levelCid)
        for i, v in ipairs(levelCfg.heroLimitID) do
            local heroData = self:getLimitHero(v)
            table.insert(formationData, self:makeFormationData(heroData, EC_BattleHeroType.LIMIT, v))
        end
    elseif isLimitSimulationTrialHero then
        local levelCfg = self:getLevelCfg(levelCid)
        for i, v in ipairs(levelCfg.heroLimitID) do
            local heroData = HeroDataMgr:getHero(v)
            heroData.isLimitHero = true
            table.insert(formationData, self:makeFormationData(heroData, EC_BattleHeroType.SIMULATION, v))
        end
    else
        for i = 1, 3 do
            local isOn = HeroDataMgr:getIsFormationOn(i)
            if isOn then
                local id = HeroDataMgr:getHeroIdByFormationPos(i)
                local heroData = HeroDataMgr:getHero(id)
                if isDisableHero then
                    local levelCfg = self:getLevelCfg(levelCid)
                    if table.indexOf(levelCfg.heroForbiddenID, heroData.cid) == -1 then
                        table.insert(formationData, self:makeFormationData(heroData, EC_BattleHeroType.OWN, heroData.cid))
                    end
                else
                    if isContainSimulationTrial or heroData.heroStatus ~= 3 then 
                        table.insert(formationData, self:makeFormationData(heroData, EC_BattleHeroType.OWN, heroData.cid))
                    else
                        HeroDataMgr:heroOnBattle(heroData.id) --不能包含试炼精灵的战斗把试炼精灵下阵处理
                    end
                end
            end
        end
    end
    return formationData
end

function FubenDataMgr:getFormationByHero(heroCid)
    local formationData = {}
    local heroData = clone(HeroDataMgr:getHero(heroCid))
    table.insert(formationData, self:makeFormationData(heroData, EC_BattleHeroType.OWN, heroData.cid))
    return formationData
end

function FubenDataMgr:getSpriteChallengeInfo()
    return self.spriteChallengeInfo_
end

function FubenDataMgr:getCurSpriteLevelCid()
    local levelCid
    local index
    if self.spriteChallengeInfo_ and self.spriteChallengeInfo_.levels then
        for i, v in ipairs(self.spriteChallengeInfo_.levels) do
            if v.status == 0 then    -- 未通过
                levelCid = v.levelCid
                index = i
                break
            end
            if i == #self.spriteChallengeInfo_.levels and not levelCid then
                levelCid = v.levelCid
                index = i
            end
        end
    end
    local index = math.mod(index, 3)
    index = (index == 0) and 3 or index

    return levelCid, index
end

function FubenDataMgr:getCurSpritePassIndex()
    local index = 1
    if self.spriteChallengeInfo_ and self.spriteChallengeInfo_.levels then
        for i, v in ipairs(self.spriteChallengeInfo_.levels) do
            if v.status == 1 then
                index = math.max(index, i)
            end
        end
    end
    index = math.min(index, 3)
    return index
end

function FubenDataMgr:getSpriteChallengeCfg(levelCid)
    return self.challengeDungen_[levelCid]
end

function FubenDataMgr:getSpriteChallengeRemainCount()
    local count = self:getSpriteChallengeTotalCount()
    local remainCount = count - self.spriteChallengeInfo_.count
    return remainCount
end

function FubenDataMgr:getSpriteChallengeTotalCount()
    local count = Utils:getKVP(24001, "time")
    return count
end

function FubenDataMgr:getSpriteReward(playerLevel)
    playerLevel = playerLevel or MainPlayer:getPlayerLv()
    local challengeRandomMap = TabDataMgr:getData("ChallengeRandom")
    local reward = {}
    for i = #challengeRandomMap, 1, -1 do
        local challengeRandom = challengeRandomMap[i]
        local level = challengeRandom.level
        if playerLevel >= level[1] and playerLevel <= level[2] then
            reward = challengeRandom.dropShow
            break
        end
    end
    return reward
end

function FubenDataMgr:setCurLevelCid(levelCid)
    self.curLevelCid_ = levelCid
end
-------------------------新模拟试炼-----------------------------
--请求模拟试炼的信息
-- function FubenDataMgr:reqSimulationTrialInfo()
--     TFDirector:send(c2s.HERO_REQ_SIMULATE_TRAIN_INFO,{}) 
-- end


-- 请求第一章任务
function FubenDataMgr:send_HERO_REQ_COMPLETE_STTASK(id)
    TFDirector:send(c2s.HERO_REQ_COMPLETE_STTASK,{id}) 
end

--检查关卡的开启状态（模拟试炼第二章用）
function FubenDataMgr:checkPlotLevelEnabled_SimulationTrial(levelCid,heroId)
    local enabled, preIsOpen, levelIsOpen = FubenDataMgr:checkPlotLevelEnabled(levelCid)
    local openDeungeons = self:getSimulationTrialHeroInfo(heroId).dungeonId or {}
    local timeOpen = false
    for i , v in ipairs(openDeungeons) do
        if v == timeOpen then 
            timeOpen = true
        end
    end 
    return enabled, preIsOpen, levelIsOpen ,timeOpen
end
function FubenDataMgr:onRevSTTaskChange(event)
    local data = event.data
    dump(event.data)
    if data.tasks then 
        for i, n_task in ipairs(data.tasks) do
            if self.simulationTrialInfo_.info then
                for i, heroInfo in ipairs(self.simulationTrialInfo_.info) do
                    for i, task in ipairs(heroInfo.tasks) do  --tasks_ 会同步更新
                        if task.id == n_task.id then 
                            task.status = n_task.status
                        end
                    end
                end
            end
        end
    end
    EventMgr:dispatchEvent(EV_SIMULATION_TRIAL_TASK_REWARD,data)
end
function FubenDataMgr:onRevCompleteSTTask(event)
    dump(event.data)
    local data = event.data
    if data.tasks then 
        for i, n_task in ipairs(data.tasks) do
            if self.simulationTrialInfo_.info then
                for i, heroInfo in ipairs(self.simulationTrialInfo_.info) do
                    for i, task in ipairs(heroInfo.tasks) do  --tasks_ 会同步更新
                        if task.id == n_task.id then 
                            task.status = n_task.status
                        end
                    end
                end
            end
        end
    end
    EventMgr:dispatchEvent(EV_SIMULATION_TRIAL_TASK_REWARD,data)

            -- {{true,{'rewards','id', 'num', }},{true,{'tasks','id', 'status',}},}

--[[
    [1] = {--ResCompleteSTTask
        [1] = {--repeated RewardsMsg
            [1] = 'int32':id
            [2] = 'int32':num
        },
        [2] = {--repeated SimulateTrainTask
            [1] = 'int32':id    [ 任务id]
            [2] = {--STTaskStaus(enum)
                'v4':STTaskStaus
            },
        },
    }
--]]
end


function FubenDataMgr:onRevSimulationTrialInfo(event)
    local data = event.data
    if not data then return end
    self.simulationTrialInfo_       = data
    self.simulationTrialInfo_.info  = self.simulationTrialInfo_.info or {}
    self.simulationTrialInfo_.info_ = {}
    for i, heroInfo in ipairs(self.simulationTrialInfo_.info) do
        self.simulationTrialInfo_.info_[heroInfo.heroId] = heroInfo
        --任务预处理分类
        heroInfo.tasks = heroInfo.tasks or {} 
        local tasks  = {}
        for i,task in ipairs(heroInfo.tasks) do
            local missionType  = TabDataMgr:getData("HerotestMission",task.id).missionType 
            tasks[missionType] = tasks[missionType] or {}
            table.insert(tasks[missionType],task) 
        end
        heroInfo.tasks_ = tasks
    end
    -- dump(self.simulationTrialInfo_)
    --活动关闭移除缓存的界面
    if not self.simulationTrialInfo_.isOpen then
        AlertManager:removeMainSceneLayerParamsCache("SimulationTrialMainView")
        AlertManager:removeMainSceneLayerParamsCache("SimulationTrialLevelView")
        AlertManager:removeMainSceneLayerParamsCache("SimulationTrialRewardPreview")
        AlertManager:removeMainSceneLayerParamsCache("SimulationTrialReward")
    end
    --数据更新
    EventMgr:dispatchEvent(EV_SIMULATION_TRIAL_UPDATE)
end


function FubenDataMgr:checkSimulationTrialLevelEnabled(levelCid,heroId)
    local enabled, preIsOpen, levelIsOpen = self:checkPlotLevelEnabled(levelCid)
    local heroInfo = self:getSimulationTrialHeroInfo(heroId)
    
    local timeOpen = false
    if heroInfo then
        local openDungeons = heroInfo.dungeonId
        if openDungeons then 
            for i,v in ipairs(openDungeons) do
                if levelCid == v then
                    timeOpen = true
                end
            end
        end
    else
        printError("找不到配置:%s", heroId)
    end
    enabled = enabled and timeOpen
    return enabled, preIsOpen, levelIsOpen ,timeOpen
end


--模拟试炼功能是否显示小红点
function FubenDataMgr:isVisiableSimulationTrialRedPoint(heroId)
    --有奖可以领
    --有关卡可打    
    if self.simulationTrialInfo_.isOpen then
        --第一章奖励
        local tasks = self.simulationTrialInfo_.tasks
        if tasks then 
            for i,v in ipairs(tasks) do
                if v.status == 2 then 
                    return true
                end
            end
        end
        --第二章奖励
        local isCanReceive, isReceiveAll = self:checkChapterStarRewardCanReceive(411, 1)
        if isCanReceive then 
            return true
        end

        local heroTestCfg = TabDataMgr:getData("HeroTest",heroId)
        -- 有关卡可以打
        for k,groupId in pairs(heroTestCfg.groupID) do
            local levels = self:getLevel(groupId)
            for i,v in ipairs(levels) do
                local enabled = self:checkSimulationTrialLevelEnabled(v,heroId)
                local pass    = self:isPassPlotLevel(v)
                if enabled and not pass then 
                    return true
                end
            end
        end
    end
end

function FubenDataMgr:getSimulationTrialIsOpen()
    return self.simulationTrialInfo_.isOpen
end

function FubenDataMgr:getSimulationTrialInfo()
    return self.simulationTrialInfo_
end
function FubenDataMgr:getSimulationTrialHeroInfo(heroId)
    if self.simulationTrialInfo_.info_[heroId] then
        return self.simulationTrialInfo_.info_[heroId]
    end
end
--成长奖励
function FubenDataMgr:getSimulationTrialReward()
    return self.simulationTrialReward
end

function FubenDataMgr:cleanSimulationTrialReward()
    self.simulationTrialReward = nil
end
--是否获得反折
function FubenDataMgr:hasFAN_ZHE(heroId)
    heroId = heroId or self:getSelectSimulationHeroId()
    local __tab__ =
    {
        [110211] = 110210 , --试炼精灵原精灵ID
        [111411] = 111401 , --试炼精灵原精灵ID
        [111511] = 111501 , --试炼精灵原精灵ID
        [110113] = 110103 , --反十
        [110414] = 110413 , --狂三
    }
    return HeroDataMgr:getIsHave(__tab__[heroId])
end

function FubenDataMgr:setSelectSimulationHeroId(heroId)
    self.simulationHeroId = heroId
end

function FubenDataMgr:getSelectSimulationHeroId()
    return self.simulationHeroId
end
--开启时间
function FubenDataMgr:getSimulationTrialActiveTime()
    if self.simulationTrialInfo_.startTime and self.simulationTrialInfo_.endTime then
        return self.simulationTrialInfo_.startTime , self.simulationTrialInfo_.endTime
    end
    local data = TabDataMgr:getData("DiscreteData",29002).data
    local startTime = Utils:getTimeByDate(data.startTime)
    local endTime   = Utils:getTimeByDate(data.endTime)
    return  startTime , startTime
end

-------------------------精灵模拟试练----------------------------
function FubenDataMgr:getSpriteExtraIsOpen()
    local isOpen = false
    if self.spriteExtraInfo_ then
        isOpen = self.spriteExtraInfo_.alwaysOpen or self.spriteExtraInfo_.status
    end
    return isOpen
end

function FubenDataMgr:getSpriteExtraInfo()
    return self.spriteExtraInfo_
end

function FubenDataMgr:getSpriteExtraLevelInfo(levelCid)
    return self.spriteExtraInfo_.levelInfos[levelCid] or {}
end

function FubenDataMgr:isSpriteExtraLevelPass(levelCid)
    local isPass = false
    local levelInfo = self.spriteExtraInfo_.levelInfos[levelCid]
    if levelInfo then
        isPass = levelInfo.win
    end
    return isPass
end

function FubenDataMgr:getSpriteExtraActiveTime()
    local starttime = self.spriteExtraInfo_.startTime
    local endtime = self.spriteExtraInfo_.endTime
    return starttime,endtime
end

function FubenDataMgr:getSpriteExtraActiveGroups()
    local groupInfo = {}
    for k,v in pairs(self.spriteExtraInfo_.levelsCfg) do
        if groupInfo[v.groupID] ==nil then
            groupInfo[v.groupID] = {unlock = false,levels = {}}
        end
        table.insert(groupInfo[v.groupID].levels,v)
        if v.opentype == 1 then
            groupInfo[v.groupID].unlock = true
        end
    end
    local groupList = {orderedkey = {},groupData = {}}
    for k,v in pairs(groupInfo) do
        if #v.levels >= 2 then
            table.sort( v.levels, function(ta,tb)
                return ta.order < tb.order
            end )
        end
        if v.unlock == true then
            table.insert(groupList.orderedkey,k)
        end
    end
    if #groupList.orderedkey >= 2 then
        table.sort(groupList.orderedkey, function(a,b)
            return a < b
        end )
    end
    for k,v in pairs(groupList.orderedkey) do
        groupList.groupData[v] = groupInfo[v]
    end
    return groupList
end

function FubenDataMgr:setSpriteExtraSelLevel(levelCid)
   self.spritExtraSelLevelCid = levelCid
end

function FubenDataMgr:getSpriteExtraSelLevel()
    return self.spritExtraSelLevelCid
end

function FubenDataMgr:getTheaterDungeonLevel(chapterCid)
    local levels = {}
    levels = self.storyDungeonLevel_[chapterCid]
    return levels
end

function FubenDataMgr:getTheaterDungeonLevelCfg(levelCid)
    return self.storyDungeonLevelMap_[levelCid]
end

function FubenDataMgr:getTheaterBossInfo()
    return self.theaterBossInfo_
end

function FubenDataMgr:checkTheaterBossOpened()
    if self.theaterBossInfo_ and self.theaterBossInfo_.status ~= EC_TheaterStatus.CLOSING then
        return true
    end
    return false
end

function FubenDataMgr:getTheaterDungeonLevelInfo(levelCid)
    local levelCfg = self:getTheaterDungeonLevelCfg(levelCid)
    local levelInfo
    if levelCfg.storydungeonType == EC_TheaterLevelType.OPTION then
        levelInfo = self.theaterDatingOptionInfo_[levelCid]
    else
        levelInfo = self:getLevelInfo(levelCid)
    end
    return levelInfo
end

function FubenDataMgr:judgeTheaterCondIsEstablish(levelCid, index, lock)
    local levelCfg = self:getTheaterDungeonLevelCfg(levelCid)
    local cond = levelCfg.unlock[index]

    if lock then
        cond = levelCfg.lock[index]
    end

    local isEstablish = self:condIsActivity(cond)
    if not cond and not lock then -- 锁定判断 默认为不成立
        isEstablish = true
    end
    return isEstablish
end

function FubenDataMgr:condIsActivity( cond )
    local isEstablish = false
    if cond then
        local predungeonIsUnlock = true
        if cond.predungeon then
            for i, v in ipairs(cond.predungeon) do
                if not self:isPassTheaterLevel(v) then
                    predungeonIsUnlock = false
                    break
                end
            end
        end

        local predatingIsUnlock = true
        if cond.predating then
            for i, v in ipairs(cond.predating) do
                if not self:isPassTheaterLevel(v) then
                    predatingIsUnlock = false
                    break
                end
            end
        end

        local predungeonIsNotPass = true
        if cond.notPass then
            for i, v in ipairs(cond.notPass) do
                if self:isPassTheaterLevel(v) then
                    predungeonIsNotPass = false
                    break
                end
            end
        end

        local predungeonResultPass = true
        if cond.predungeonResult then
            for i, v in ipairs(cond.predungeonResult) do
                if not self:judgeStarIsActive(v.id,v.star) then
                    predungeonResultPass = false
                    break
                end
            end
        end
        
        isEstablish = predungeonIsUnlock and predatingIsUnlock and predungeonIsNotPass and predungeonResultPass
    end
    return isEstablish
end

function FubenDataMgr:checkTheaterLevelEnabled(levelCid)
    local levelCfg = self:getTheaterDungeonLevelCfg(levelCid)
    local enabled = true
    for i, v in ipairs(levelCfg.unlock) do
        if self:judgeTheaterCondIsEstablish(levelCid, i) then
            enabled = true
            break
        else
            enabled = false
        end
    end
    return enabled
end

function FubenDataMgr:checkTheaterLevelLocked( levelCid )
    local levelCfg = self:getTheaterDungeonLevelCfg(levelCid)
    local lock = false
    for i, v in ipairs(levelCfg.lock) do
        if self:judgeTheaterCondIsEstablish(levelCid, i, true) then
            lock = true
            break
        else
            lock = false
        end
    end
    return lock
end

function FubenDataMgr:checkTheaterChapterEnabled(chapterCid)
    local levels = self:getTheaterDungeonLevel(chapterCid)
    local chapterCfg = self:getChapterCfg(chapterCid)
    local condEnabled = false
    for i, v in ipairs(levels) do
        if self:checkTheaterLevelEnabled(v) then
            condEnabled = true
            break
        end
    end

    local serverTime = ServerDataMgr:getServerTime()
    local timeEnabled = serverTime >= chapterCfg.openTime2 / 1000
    if self.theaterBossInfo_.nodeStatus and serverTime >= chapterCfg.openTime / 1000 then
        local maxCfg = self.theaterBossInfo_.nodeStatus[#self.theaterBossInfo_.nodeStatus]
        local contributionEnabled = self.theaterBossInfo_.serverContribution >= maxCfg.contribution
        timeEnabled = timeEnabled or contributionEnabled
    end
    local levelEnabeld = MainPlayer:getPlayerLv() >= chapterCfg.unlockLevel
    local enabled = condEnabled and timeEnabled and levelEnabeld
    return enabled, condEnabled, timeEnabled, levelEnabeld
end

function FubenDataMgr:isPassTheaterLevel(levelCid)
    local levelCfg = self:getTheaterDungeonLevelCfg(levelCid)
    local isPass = false
    if levelCfg.storydungeonType == EC_TheaterLevelType.OPTION then
        local levelInfo = self:getTheaterDungeonLevelInfo(levelCid)
        isPass = tobool(levelInfo)
    elseif levelCfg.storydungeonType == EC_TheaterLevelType.CONDITION then
        local cond = levelCfg.unlock[1]
        if cond then
            isPass = self.theaterBossInfo_.lingbo >= cond.spirit
        else
            isPass = true
        end
    else
        isPass = self:isPassPlotLevel(levelCid)
    end
    return isPass
end

function FubenDataMgr:getTheaterGroupLevels(chapterCid)
    local groupLevels = self.storyGroupDungeonLevel_[chapterCid]
    return groupLevels
end

function FubenDataMgr:getTheaterDungeonLevelWeight(levelCid)
    local weight = self.theaterLevelWeight_[levelCid]
    return weight or 99999
end

function FubenDataMgr:setTheaterLevelAni(theaterId,index)
    self.theaterLevelAni_[theaterId.."-"..index] = true
end

function FubenDataMgr:getTheaterLevelAni(theaterId,index)
    if theaterId and index then
        return tobool(self.theaterLevelAni_[theaterId.."-"..index])
    else
        return self.theaterLevelAni_
    end
end

function FubenDataMgr:getTheaterChallengeInfo()
    return self.theaterNotice_
end

------------------------------------------------------------

function FubenDataMgr:send_PLAYER_REQ_HELP_FIGHT_PLAYERS()
    TFDirector:send(c2s.PLAYER_REQ_HELP_FIGHT_PLAYERS, {})
end

function FubenDataMgr:send_DUNGEON_GET_LEVEL_GROUP_REWARD(levelGroupId, diff, starNum)
    TFDirector:send(c2s.DUNGEON_GET_LEVEL_GROUP_REWARD, {levelGroupId, diff, starNum})
end

function FubenDataMgr:send_DUNGEON_BUY_FIGHT_COUNT(levelGroupId)
    TFDirector:send(c2s.DUNGEON_BUY_FIGHT_COUNT, {levelGroupId})
end

function FubenDataMgr:send_DUNGEON_FIGHT_START(levelId, assistantPlayerId, assistantHeroCid, limitHeros, quickCount, isDuelMod)
    TFDirector:send(c2s.DUNGEON_FIGHT_START, {levelId, assistantPlayerId, assistantHeroCid, limitHeros, quickCount, isDuelMod})
end

function FubenDataMgr:send_DUNGEON_FIGHT_OVER(levelId, isWin, reachStar, maxComboNum, pickUpTypeCount, pickUpCount, killTargets, costTime, damage,rating ,skillEnemy)
    maxComboNum = maxComboNum or 0
    pickUpTypeCount = pickUpTypeCount or 0
    pickUpCount = pickUpCount or 0
    killTargets = killTargets or {}
    costTime = costTime or 0
    damage =damage or 0
    rating = rating or 0
    skillEnemy = skillEnemy or {}
    TFDirector:send(c2s.DUNGEON_FIGHT_OVER, {levelId, isWin, reachStar, maxComboNum, pickUpTypeCount, pickUpCount, killTargets, costTime, damage,rating,skillEnemy})
end

function FubenDataMgr:send_ENDLESS_CLOISTER_REQ_START_FIGHT_ENDLESS()
    TFDirector:send(c2s.ENDLESS_CLOISTER_REQ_START_FIGHT_ENDLESS, {})
end

function FubenDataMgr:send_ENDLESS_CLOISTER_REQ_PASS_STAGE_ENDLESS(stageId, costTime, health, isPass, maxComboNum, damage)
    TFDirector:send(c2s.ENDLESS_CLOISTER_REQ_PASS_STAGE_ENDLESS, {stageId, costTime, health, isPass, maxComboNum, damage})
end

function FubenDataMgr:send_DUNGEON_LIMIT_HERO_DUNGEON(levelCid)
    dump({"請求限定",levelCid})
    TFDirector:send(c2s.DUNGEON_LIMIT_HERO_DUNGEON, {levelCid})
end

function FubenDataMgr:send_DUNGEON_BUY_LEVEL_COUNT(levelCid)
    TFDirector:send(c2s.DUNGEON_BUY_LEVEL_COUNT, {levelCid})
end

function FubenDataMgr:send_HERO_CHALLENGE_REFRESH_BUFF()
    TFDirector:send(c2s.HERO_CHALLENGE_REFRESH_BUFF, {})
end

function FubenDataMgr:send_HERO_CHALLENGE_CHALLENGE_AWARD()
    TFDirector:send(c2s.HERO_CHALLENGE_CHALLENGE_AWARD, {})
end

function FubenDataMgr:send_ENDLESS_CLOISTER_REQ_ENDLESS_RANK_LIST()
    TFDirector:send(c2s.ENDLESS_CLOISTER_REQ_ENDLESS_RANK_LIST, {})
end

function FubenDataMgr:send_ENDLESS_CLOISTER_REQ_ENDLESS_BUFF(levelCid)
    TFDirector:send(c2s.ENDLESS_CLOISTER_REQ_ENDLESS_BUFF, {levelCid})
end

function FubenDataMgr:send_ENDLESS_CLOISTER_REQ_START_STAGE(isJump)
    TFDirector:send(c2s.ENDLESS_CLOISTER_REQ_START_STAGE, {isJump})
end

function FubenDataMgr:send_ODEUM_REQ_RANK(rankType)
    TFDirector:send(c2s.ODEUM_REQ_RANK, {rankType})
end

function FubenDataMgr:send_ODEUM_REQ_NODE_PRIZE()
    TFDirector:send(c2s.ODEUM_REQ_NODE_PRIZE, {})
end

function FubenDataMgr:send_ODEUM_UPDATE_CONTRIBUTION()
    TFDirector:send(c2s.ODEUM_UPDATE_CONTRIBUTION, {})
end

function FubenDataMgr:send_ODEUM_REQ_NOTICE()
    TFDirector:send(c2s.ODEUM_REQ_NOTICE, {})
end

function FubenDataMgr:send_ODEUM_OPEN_PANEL()
    TFDirector:send(c2s.ODEUM_OPEN_PANEL, {})
end

function FubenDataMgr:send_ODEUM_REQ_SELF_CONTRI_PRIZE(id)
    TFDirector:send(c2s.ODEUM_REQ_SELF_CONTRI_PRIZE, {id})
end

function FubenDataMgr:onRecvAllLevelInfo(event)
    self.levelInfo_      = {}
    self.levelGroupInfo_ = {}
    self:onRecvLevelInfo(event)
end

function FubenDataMgr:onRecvLevelInfo(event)
	print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~FubenDataMgr:onRecvLevelInfo=");
    local data = event.data
    if data.levelInfos then
        local levelInfo = data.levelInfos.levelInfos
        if levelInfo then
            for _, info in ipairs(levelInfo) do
                self.levelInfo_[info.cid] = info
            end
        end
    end
    if data.groups then
        local levelGroupInfo = data.groups.group
        if levelGroupInfo then
            for _, info in ipairs(levelGroupInfo) do
                if info.rewardInfo then
                    local rewardInfo = {}
                    for _, rInfo in ipairs(info.rewardInfo) do
                        rewardInfo[rInfo.key] = rInfo.list
                    end
                    info.rewardInfo = rewardInfo
                end
                self.levelGroupInfo_[info.cid] = info
            end
        end
    end
    EventMgr:dispatchEvent(EV_FUBEN_LEVELINFOUPDATE)
end

function FubenDataMgr:onRecvFightStart(event)
    AlertManager:closeLayerByName("FubenSquadView")
    local data = event.data
    if data.helpPid ~= 0 then
        if FriendDataMgr:isFriend(data.helpPid) then
            local cd = Utils:getKVP(6001, "cd")
            local sec = ServerDataMgr:getServerTime() + cd * 60
            FriendDataMgr:setFriendHelpCDtime(data.helpPid, sec)
        else
            self:popAssistHero(data.helpPid)
        end
    end
    self.curLevelCid_ = data.levelCid
    local levelCfg = self:getLevelCfg(data.levelCid)

    local battleController = require("lua.logic.battle.BattleController")
    if levelCfg.dungeonType == EC_FBLevelType.FIGHTING or levelCfg.dungeonType == EC_FBLevelType.THEATER_FIGHTING or levelCfg.dungeonType == EC_FBLevelType.KUANGSAN_FIGHTING then
        if levelCfg.fightingMode == 2 or levelCfg.fightingMode == 3 then
            local flightController = require("lua.logic.battle.flight.FlightController")
            flightController.enterBattle(data, EC_BattleType.COMMON)
        else
            battleController.enterBattle(data, EC_BattleType.COMMON)
        end
        EventMgr:dispatchEvent(EV_BATTLE_FIGHTSTART)
    elseif levelCfg.dungeonType == EC_FBLevelType.DATING or levelCfg.dungeonType == EC_FBLevelType.THEATER_DATING or levelCfg.dungeonType == EC_FBLevelType.KUANGSAN_DATING then
        DatingDataMgr:sendGetSciptMsg(EC_DatingScriptType.FUBEN_SCRIPT,nil,nil, levelCfg.datingID[1])
    elseif levelCfg.dungeonType == EC_FBLevelType.CITYDATING then
        NewCityDataMgr:sendGetCitySetpData(EC_NewCityType.NewCity_FuBen, levelCfg.datingID[1], RoleDataMgr:getCurId())
    elseif levelCfg.dungeonType == EC_FBLevelType.SPRITE then
        battleController.enterBattle(data, EC_BattleType.COMMON)
    elseif levelCfg.dungeonType == EC_FBLevelType.KABALATREE then
        KabalaTreeDataMgr:setInWorldFage(false)
        battleController.enterBattle(data, EC_BattleType.COMMON)
        EventMgr:dispatchEvent(EV_BATTLE_FIGHTSTART)
    elseif levelCfg.dungeonType == EC_FBLevelType.SPRITE_EXTRA then
        battleController.enterBattle(data, EC_BattleType.COMMON)
    elseif levelCfg.dungeonType == EC_FBLevelType.HALLOWEEN then
        battleController.enterBattle(data, EC_BattleType.COMMON)
    elseif levelCfg.dungeonType == EC_FBLevelType.THEATER_BOSS then
        battleController.enterBattle(data, EC_BattleType.COMMON)
    elseif levelCfg.dungeonType == EC_FBLevelType.CHRISTMAS then
        battleController.enterBattle(data, EC_BattleType.COMMON)
    elseif levelCfg.dungeonType == EC_FBLevelType.NIANBREAST then
        battleController.enterBattle(data, EC_BattleType.COMMON)
    elseif levelCfg.dungeonType == EC_FBLevelType.DALMAP then
        DalMapDataMgr:setInWorldFage(false)
        battleController.enterBattle(data, EC_BattleType.COMMON)
        EventMgr:dispatchEvent(EV_BATTLE_FIGHTSTART)
    elseif levelCfg.dungeonType == EC_FBLevelType.TXJZ then
        battleController.enterBattle(data, EC_BattleType.COMMON)
    elseif levelCfg.dungeonType == EC_FBLevelType.SKYLADDER then
        SkyLadderDataMgr:setSkyLadderMainViewState(true)
        battleController.enterBattle(data, EC_BattleType.COMMON)
    elseif levelCfg.dungeonType == EC_FBLevelType.HUNTER then
        battleController.enterBattle(data, EC_BattleType.COMMON)
    end
    self:cachePlayerInfo()
end

function FubenDataMgr:onRecvFightOver(event)
	print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~FubenDataMgr:onRecvFightOver=");
    local data = event.data
    local levelInfo = data.levelInfo
    local dropReward = data.rewards or {}
    local isWin = data.win
    self.simulationTrialReward = nil
    local levelCfg = self:getLevelCfg(levelInfo.cid)
    if levelInfo and levelInfo.win then
        local levelGroupCfg = self:getLevelGroupCfg(levelCfg.levelGroupId)
        local rawUnlock = self:isPassPlotLevel(levelInfo.cid)

        if levelGroupCfg.dungeonChapterId == 1 then  --英文版检测第一章是否全通关
            local dataDisCreateLevel = TabDataMgr:getData("DiscreteData" , 1100008).data
            for k ,v in pairs(dataDisCreateLevel.levelId) do
                if not self.levelInfo_[v] then
                    self.isNeedCheckAllPassWin = true
                end
            end
        end

        self.levelInfo_[data.levelInfo.cid] = levelInfo
        if not rawUnlock then
            if levelCfg.lastOne then
                self:setUnlockNextChapterCid(levelGroupCfg.dungeonChapterId)
                --记录5星好评价
                if levelGroupCfg.dungeonChapterId == 2 then
                    CommonManager:setStarEvaluateFlage(true)
                end
            end
        end
        FunctionDataMgr:updateOpenFuncList()
        --试炼第一章 奖励
        if levelGroupCfg.id == 500002 
            or levelGroupCfg.id == 500004
            or levelGroupCfg.id == 500008
            or levelGroupCfg.id == 500010
            or levelGroupCfg.id == 500006 then 
            self.simulationTrialReward = {}
            for i,v in ipairs(dropReward) do
                if v.id >= 599801 and v.id <= 599895 then
                    table.insert(self.simulationTrialReward,v)
                end
            end
        end
        EventMgr:dispatchEvent(EV_FUBEN_LEVELINFOUPDATE)
    end
    if levelCfg.dungeonType == EC_FBLevelType.FIGHTING then
        BattleDataMgr:setBattleResutlData(dropReward)
        EventMgr:dispatchEvent(EV_BATTLE_FIGHTOVER, dropReward, isWin)
    elseif levelCfg.dungeonType == EC_FBLevelType.DATING or levelCfg.dungeonType == EC_FBLevelType.THEATER_DATING or levelCfg.dungeonType == EC_FBLevelType.KUANGSAN_DATING then
        DatingDataMgr:setIsDating(false)
        if levelCfg.isbirthType ~= 1 and levelCfg.dungeonType ~= EC_FBLevelType.KUANGSAN_DATING then
            self:openFuben()
            AlertManager:showLevelUpPopView()
        elseif levelCfg.dungeonType == EC_FBLevelType.KUANGSAN_DATING then
            FunctionDataMgr:jKsanFuben()
        end
    elseif levelCfg.dungeonType == EC_FBLevelType.CITYDATING then
        AlertManager:setOpenFubenCom(true)
        AlertManager:changeScene(SceneType.MainScene)
    elseif levelCfg.dungeonType == EC_FBLevelType.SPRITE then
        BattleDataMgr:setBattleResutlData(dropReward)
        EventMgr:dispatchEvent(EV_BATTLE_FIGHTOVER, dropReward, isWin)
    elseif levelCfg.dungeonType == EC_FBLevelType.KABALATREE then
        BattleDataMgr:setBattleResutlData(dropReward)
        KabalaTreeDataMgr:overKabalaFight(isWin)
        EventMgr:dispatchEvent(EV_BATTLE_FIGHTOVER, dropReward, isWin)
    elseif levelCfg.dungeonType == EC_FBLevelType.SPRITE_EXTRA then
        BattleDataMgr:setBattleResutlData(dropReward)
        EventMgr:dispatchEvent(EV_BATTLE_FIGHTOVER, dropReward, isWin)
    elseif levelCfg.dungeonType == EC_FBLevelType.DALMAP then
        BattleDataMgr:setBattleResutlData(dropReward)
        DalMapDataMgr:overDalFight(isWin)
        EventMgr:dispatchEvent(EV_BATTLE_FIGHTOVER, dropReward, isWin)
    else
        BattleDataMgr:setBattleResutlData(dropReward)
        EventMgr:dispatchEvent(EV_BATTLE_FIGHTOVER, dropReward, isWin)
    end
end

function FubenDataMgr:onRecvFightAsstiant(event)
    local data = event.data
    if data.players then
        self.assistantData_ = data.players
        EventMgr:dispatchEvent(EV_FUBEN_ASSISTANTUPDATE)
    end
end

function FubenDataMgr:onRecvLevelGroupReward(event)
    local data = event.data
    local rewardInfo = {}
    for i, v in ipairs(data.rewardInfo) do
        rewardInfo[v.key] = v.list
    end
    local levelGroupInfo = self:getLevelGroupInfo(data.cid)
    if levelGroupInfo then
        levelGroupInfo.rewardInfo = rewardInfo
    end
    EventMgr:dispatchEvent(EV_FUBEN_LEVELGROUPREWARD, data.difficulty, data.starNum)
end

function FubenDataMgr:onRecvUpdateLevelGroupInfo(event)
    local data = event.data
    if not data then return end
    local levelGroupInfo = data.group
    if levelGroupInfo then
        self.levelGroupInfo_[levelGroupInfo.cid] = levelGroupInfo
    end
end

function FubenDataMgr:onRecvUpdateLevelInfo(event)
	print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~FubenDataMgr:onRecvUpdateLevelInfo=");
    local data = event.data
    if not data.levelInfos then return end
    for _, info in ipairs(data.levelInfos) do
        self.levelInfo_[info.cid] = info
    end
end

function FubenDataMgr:onRecvBuyFightCount(event)
    local data = event.data
    EventMgr:dispatchEvent(EV_FUBEN_DAILYBUYCOUNT, data.cid)
end

function FubenDataMgr:onRecvEndlessInfo(event)
    local data = event.data
    if not data.info then return end
    self.endlessInfo_ = data.info
    EventMgr:dispatchEvent(EV_FUBEN_UPDATEENDLESSINFO)
end

function FubenDataMgr:onRecvStartFightEndless(event)
    AlertManager:closeLayerByName("FubenSquadView")
    local data = event.data
    self.curLevelCid_ = data.levelCid
    local battleController = require("lua.logic.battle.BattleController")
    battleController.enterBattle(data, EC_BattleType.ENDLESS)
    EventMgr:dispatchEvent(EV_FUBEN_ENDLESSFIGHTSTART)
    self:cachePlayerInfo()
end

function FubenDataMgr:onRecvPassEndless(event)
    local data = event.data
    if data.nextLevelCid ~= 0 then
        self.endlessInfo_.curStage = data.nextLevelCid
    end
    EventMgr:dispatchEvent(EV_FUBEN_ENDLESSFIGHTVICTORY, data.rewards)
end

function FubenDataMgr:onRecvLimitHeros(event)
    local function changesid(hero)
        local sid = hero.id
        local id  = hero.cid;
        hero.sid  = tostring(sid);
        hero.id   = id;
    end

    local data = event.data
    -- print("==============",data)
    if not data.heros then return end
    for i, v in ipairs(data.heros) do
        local newAttr = {}
        for _, attr in pairs(v.heros.attr) do
            newAttr[attr.type] = attr.val
        end
        v.heros.attr = newAttr
        v.heros.isLimitHero = true
        local heroCfg = TabDataMgr:getData("Hero", v.heros.cid)
        local hero = {}
        hero = table.merge(hero, heroCfg)
        hero = table.merge(hero, v.heros)
        changesid(hero)
        self.limitHeros_[v.limitId] = hero
    end
    self.levelFormation_[data.leveId] = clone(data.limitFormation)
    self.originLevelFormation_[data.leveId] = data.limitFormation
    EventMgr:dispatchEvent(EV_FUBEN_UPDATE_LIMITHERO)
end

function FubenDataMgr:onRecvGroupMultipleReward(event)
    local data = event.data
    if not data.multipleInfo then return end

    self.dailyMultipleInfo_ = {}
    for i, v in ipairs(data.multipleInfo) do
        self.dailyMultipleInfo_[v.groupId] = v
    end
end

function FubenDataMgr:onRecvLevelBuyCount(event)
	print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~FubenDataMgr:onRecvLevelBuyCount=");
    local data = event.data
    if not data.levelInfo then return end
    self.levelInfo_[data.levelInfo.cid] = data.levelInfo
    EventMgr:dispatchEvent(EV_FUBEN_PLOTLEVEL_BUY_COUNT)
end

function FubenDataMgr:onRecvSpriteChallengeInfo(event)
    local data = event.data
    if not data then return end
    self.spriteChallengeInfo_ = data
    EventMgr:dispatchEvent(EV_FUBEN_SPRITE_UPDATE_INFO)
end

function FubenDataMgr:onRecvSpriteRefreshBuffer(event)
    local data = event.data
    if not data.buffCid then return end
    self.spriteChallengeInfo_.buffCid = data.buffCid
    self.spriteChallengeInfo_.buffCount = data.buffCount
    EventMgr:dispatchEvent(EV_FUBEN_SPRITE_UPDATE_BUFF)
end

function FubenDataMgr:onRecvGetSpriteReward(event)
    local data = event.data
    local rewards = data.rewards or {}
    EventMgr:dispatchEvent(EV_FUBEN_SPRITE_GET_REWARD, rewards)
end

--精灵外传收到服务端消息
function FubenDataMgr:onRecvSpriteExtraLevelsInfo(event)
    local data = event.data
    if data == nil then
        return
    end
    self.spriteExtraInfo_["levelInfos"] = {}
    for k,v in pairs(data) do
        if k == "levelInfos" then
            for s,t in pairs(v) do
                self.spriteExtraInfo_["levelInfos"][t.cid] = t
            end
        else
            self.spriteExtraInfo_[k] = v
        end
    end
    self.spriteExtraInfo_["levelsCfg"] = TabDataMgr:getData("Herodemo")
    EventMgr:dispatchEvent(EV_FUBEN_SPRITE_EXTRA_UPDATE_INFO)
end

function FubenDataMgr:onRecvSpriteExtraLevelUpdateInfo(event)
    local data = event.data
    if data == nil then
        return
    end
    if self.spriteExtraInfo_.levelInfos == nil then
        self.spriteExtraInfo_.levelInfos = {}
    end
    self.spriteExtraInfo_.levelInfos[data.cid] = data
    EventMgr:dispatchEvent(EV_FUBEN_SPRITE_EXTRA_UPDATE_INFO)
end

function FubenDataMgr:getLastEndlessRankInfo()
    return self.lastCycleList,self.selflastCycleRank
end

function FubenDataMgr:getCurEndlessRankInfo()
    return self.presentRankList,self.selfpresentRank
end

function FubenDataMgr:onRecvEndlessRank(event)
    local data = event.data
    if not data then return end

    self.lastCycleList = data.lastCycleList or {}
    self.selflastCycleRank = data.lastCycleRank

    self.presentRankList = data.presentRankList or {}
    self.selfpresentRank = data.presentRank

    --self.lastCycleList = data.rankList or {}
    --self.selflastCycleRank = data.rank
    --
    --self.presentRankList = data.rankList or {}
    --self.selfpresentRank = data.rank

    EventMgr:dispatchEvent(EV_FUBEN_ENDLESS_UPDATERANK, data.rankList, data.rank, data.refreshMinu)
end

function FubenDataMgr:onRecvEndlessLevelBuff(event)
    local data = event.data
    if not data then return end
    EventMgr:dispatchEvent(EV_FUBEN_ENDLESS_BUFFER, data.levelBuffs)
end

function FubenDataMgr:onRecvEndlessJumpLevel(event)
    local data = event.data
    if not data then return end
    EventMgr:dispatchEvent(EV_FUBEN_ENDLESS_JUMPLEVEL, data.nonstop, data.rewards)
end

function FubenDataMgr:onRecvOpenTheaterBossInfo(event)
    local data = event.data
    if not data then return end
    self.theaterBossInfo_ = data
    self.theaterBossInfo_.selfContriPrizeStatus = self.theaterBossInfo_.selfContriPrizeStatus or {}
    EventMgr:dispatchEvent(EV_FUBEN_THEATER_BOSS_INFO)
end

function FubenDataMgr:onRecvTheaterRank(event)
    local data = event.data
    if not data then return end
    EventMgr:dispatchEvent(EV_FUBEN_THEATER_RANK, data.rankType, data.ranks or {}, data.myRank, data.myScore)
end

function FubenDataMgr:onRecvTheaterLevelCid(event)
    local data = event.data
    if not data then return end

    if data.bossDungeonId and self.theaterBossInfo_ then
        self.theaterBossInfo_.bossDungeonId = data.bossDungeonId
        EventMgr:dispatchEvent(EV_FUBEN_THEATER_BOSS_INFO)
    end
end

function FubenDataMgr:onRecvTheaterLingbo(event)
    local data = event.data
    if not data then return end

    if data.lingbo and self.theaterBossInfo_ then
        self.theaterBossInfo_.lingbo = data.lingbo
        EventMgr:dispatchEvent(EV_FUBEN_THEATER_BOSS_INFO)
    end
end

function FubenDataMgr:onRecvTheaterStatus(event)
    local data = event.data
    if not data then return end

    if data.status and self.theaterBossInfo_ then
        self.theaterBossInfo_.status = data.status
        EventMgr:dispatchEvent(EV_FUBEN_THEATER_BOSS_INFO)
    end
end

function FubenDataMgr:onRecvUpdateTheaterContribution(event)
    local data = event.data
    if not data then return end

    if data.serverContribution and self.theaterBossInfo_ then
        if data.serverContribution ~= -1 then
            self.theaterBossInfo_.serverContribution = data.serverContribution
            EventMgr:dispatchEvent(EV_FUBEN_THEATER_BOSS_INFO)
        end
    end
end

function FubenDataMgr:onRecvTheaterLevelInfo(event)
    local data = event.data
    if not data then return end
    if data.conditons then
        if data.conditons.datingNodes then
            for i, v in ipairs(data.conditons.datingNodes) do
                self.theaterDatingOptionInfo_[v] = true
            end
        end
    end

    if data.levels then
        self.theaterLevelOrder_ = data.levels
        for i, v in ipairs(self.theaterLevelOrder_) do
            self.theaterLevelWeight_[v] = i
        end
    end
end

function FubenDataMgr:onRecvTheaterReceiveReward(event)
    local data = event.data
    if not data then return end
    self.theaterBossInfo_.receiveStatus = EC_TheaterReceiveStatus.GETED
    EventMgr:dispatchEvent(EV_FUBEN_THEATER_NODE_REWARD, data.rewards or {})
end

function FubenDataMgr:onRecvUpdateTheaterOptionInfo(event)
    local data = event.data
    if not data then return end

    if data.datingNodes then
        for i, v in ipairs(data.datingNodes) do
            self.theaterDatingOptionInfo_[v] = true
        end
    end
end

function FubenDataMgr:onRecvUpdateTheaterLevelOrder(event)
    local data = event.data
    if not data then return end

    if data.level then
        for i, v in ipairs(data.level) do
            table.insert(self.theaterLevelOrder_, v)
            self.theaterLevelWeight_[v] = #self.theaterLevelOrder_
        end
    end
end

function FubenDataMgr:onRecvUpdateTheaterNotice(event)
    local data = event.data
    if not data then return end

    if data.name and data.contribution then
        local item = {
            name = data.name,
            contribution = data.contribution,
        }
        table.insert(self.theaterNotice_, item)
        local gap = #self.theaterNotice_ - 10
        for i = 1, gap do
            table.remove(self.theaterNotice_, 1)
        end
        EventMgr:dispatchEvent(EV_FUBEN_THEATER_UPDATE_NOTICE)
    end
end

function FubenDataMgr:onRecvTheaterReward(event)
    local data = event.data
    self.theaterBossInfo_.selfContriPrizeStatus = self.theaterBossInfo_.selfContriPrizeStatus or {}
    table.insert(self.theaterBossInfo_.selfContriPrizeStatus, data.prizeIndex)
    EventMgr:dispatchEvent(EV_FUBEN_THEATER_RECEIVE_REWARD, data.prizeIndex, data.selfContriRewards)
end

function FubenDataMgr:onRecvTheaterContorProcess( event )
    local data = event.data
    if not data then return end
    self.theaterControlProcess[data.chapterId] = data.id
    EventMgr:dispatchEvent(EV_FUBEN_THEATER_CONTRO_PROCESS)
end

function FubenDataMgr:onRecvUpdataTheaterContorProcess( event )
    local data = event.data
    if not data then return end
    self.theaterControlProcess[data.chapterId] = data.id
end

function FubenDataMgr:getTheaterContorProcess( chapterId )
    if not self.theaterControlProcess[chapterId] then
        TFDirector:send(c2s.ODEUM_REQ_FINISH_PROCESS,{chapterId})
        return -10
    end
    return self.theaterControlProcess[chapterId]
end

function FubenDataMgr:saveTheaterContorProcess( chapterId , stepId)
    if stepId and chapterId then
    self.theaterControlProcess[chapterId] = stepId
        TFDirector:send(c2s.ODEUM_REQ_UPDATE_FINISH_PROCESS,{stepId,chapterId})
    end
end

--海王星联动

function FubenDataMgr:sendLinkageCG(id)
    TFDirector:send(c2s.DUNGEON_REQ_TIME_LINKAGE_CG,{id})
end

function FubenDataMgr:getLinkageInfo()
    return self.linkageInfo
end

function FubenDataMgr:getLinkageChapterInfo(chapterCid)
    if self.linkageInfo and self.linkageInfo.dungeons then
        for i,v in ipairs(self.linkageInfo.dungeons) do
            if v.chapterCid == chapterCid then 
                return v
            end
        end
    end
    Box("未找到 "..tostring(chapterCid).." 联动作战数据")
    return  { ["begin"] = 1569168000 , ["chapterCid"] = 3001 ,["end"] = 1570463940}  --坑爹使用了lua 关键字end
end

function FubenDataMgr:onRevLinkageInfo(event)
    self.linkageInfo = event.data
    -- dump(self.linkageInfo)
end

function FubenDataMgr:onRevLinkageCG(event)
    dump(event.data)
    if self.linkageInfo then 
        self.linkageInfo.CGCids = event.data.cids
    end 
end

---狂三副本
function FubenDataMgr:getKsanLevelInfo(dungenLevel)
    return self.ksDungeonCityCfgMap[dungenLevel]
end


function FubenDataMgr:checkIsAllChapterPassWin()
    if not self.isNeedCheckAllPassWin then  return end
    local data = TabDataMgr:getData("DiscreteData",1100008).data
    for k , v in pairs(data.levelId) do
        if not self:isPassPlotLevel(v) then
            return false
        end
    end
    self.isNeedCheckAllPassWin = false
    return true
end

return FubenDataMgr:new()
