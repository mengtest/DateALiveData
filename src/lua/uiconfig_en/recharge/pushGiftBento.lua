local t = 
{
	version = 1,
	components = 
	{
		
		{
			controlID = "Panel-pushGiftBento_Layer1_recharge_Game",
			UUID = "61eeb018_5c5f_490d_b1c2_d5a7601587ab",
			anchorPoint = "False",
			anchorPointX = "0",
			anchorPointY = "0",
			backGroundScale9Enable = "False",
			bgColorOpacity = "50",
			bIsOpenClipping = "False",
			classname = "MEPanel",
			colorType = "0;SingleColor:#FFFF4500;GraduallyChangingColorStart:#FFFFFFFF;GraduallyChangingColorEnd:#FFFFFFFF;vectorX:0;vectorY:0",
			DesignHeight = "640",
			DesignType = "0",
			DesignWidth = "960",
			dstBlendFunc = "771",
			height = "640",
			ignoreSize = "False",
			name = "Panel",
			sizepercentx = "100",
			sizepercenty = "100",
			sizeType = "1",
			srcBlendFunc = "1",
			touchAble = "False",
			UILayoutViewModel = 
			{
				
			},
			uipanelviewmodel = 
			{
				Layout="Absolute",
				nType = "0"
			},
			width = "1136",
			ZOrder = "1",
			components = 
			{
				
				{
					controlID = "Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
					UUID = "95e463a5_690b_4af4_84a1_ed669f09b58a",
					anchorPoint = "False",
					anchorPointX = "0.5",
					anchorPointY = "0.5",
					backGroundScale9Enable = "False",
					bgColorOpacity = "50",
					bIsOpenClipping = "False",
					classname = "MEPanel",
					colorType = "0;SingleColor:#FFE6E6E6;GraduallyChangingColorStart:#FFFFFFFF;GraduallyChangingColorEnd:#FFFFFFFF;vectorX:0;vectorY:0",
					DesignHeight = "640",
					DesignType = "0",
					DesignWidth = "960",
					dstBlendFunc = "771",
					height = "640",
					ignoreSize = "False",
					name = "Panel_root",
					sizepercentx = "100",
					sizepercenty = "100",
					sizeType = "1",
					srcBlendFunc = "1",
					touchAble = "False",
					UILayoutViewModel = 
					{
						PositionX = 568,
						PositionY = 320,
						IsPercent = true,
						PercentX = 50,
						PercentY = 50,
						relativeToName = "Panel",
						nGravity = 6,
						nAlign = 5
					},
					uipanelviewmodel = 
					{
						Layout="Absolute",
						nType = "0"
					},
					width = "1136",
					ZOrder = "1",
					components = 
					{
						
						{
							controlID = "Image_diban_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
							UUID = "47dfa0c2_8392_4f42_9c18_9ec0c134a1b5",
							anchorPoint = "False",
							anchorPointX = "0.5",
							anchorPointY = "0.5",
							backGroundScale9Enable = "False",
							classname = "MEImage",
							dstBlendFunc = "771",
							height = "444",
							ignoreSize = "True",
							name = "Image_diban",
							sizepercentx = "0",
							sizepercenty = "0",
							sizeType = "0",
							srcBlendFunc = "1",
							texturePath = "ui/recharge/gifts/bento/5.png",
							touchAble = "False",
							UILayoutViewModel = 
							{
								PositionX = 21,
								PositionY = -31,
								relativeToName = "Panel",
								nGravity = 6,
								nAlign = 5
							},
							width = "819",
							ZOrder = "1",
						},
						{
							controlID = "Button_close_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
							UUID = "c65e4290_a093_46e6_8ec8_de9347ff7f44",
							anchorPoint = "False",
							anchorPointX = "0.5",
							anchorPointY = "0.5",
							backGroundScale9Enable = "False",
							classname = "MEButton",
							ClickHighLightEnabled = "True",
							dstBlendFunc = "771",
							flipX = "False",
							flipY = "False",
							height = "55",
							ignoreSize = "True",
							name = "Button_close",
							normal = "ui/recharge/gifts/bento/1.png",
							sizepercentx = "0",
							sizepercenty = "0",
							sizeType = "0",
							srcBlendFunc = "1",
							touchAble = "True",
							UILayoutViewModel = 
							{
								PositionX = 311,
								PositionY = 160,
							},
							UItype = "Button",
							width = "53",
							ZOrder = "10",
						},
						{
							controlID = "ImageDescript_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
							UUID = "7da80170_dbd9_4620_9773_2441aa81cff8",
							anchorPoint = "False",
							anchorPointX = "0.5",
							anchorPointY = "0.5",
							backGroundScale9Enable = "False",
							classname = "MEImage",
							dstBlendFunc = "771",
							height = "103",
							ignoreSize = "True",
							name = "ImageDescript",
							sizepercentx = "0",
							sizepercenty = "0",
							sizeType = "0",
							srcBlendFunc = "1",
							texturePath = "ui/recharge/gifts/bento/2.png",
							touchAble = "False",
							UILayoutViewModel = 
							{
								PositionX = -267,
								PositionY = 195,
							},
							width = "156",
							ZOrder = "1",
							components = 
							{
								
								{
									controlID = "DesLabel_ImageDescript_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
									UUID = "acd2cbb8_8ef5_46e3_8b42_8e399b1e5db3",
									anchorPoint = "False",
									anchorPointX = "0.5",
									anchorPointY = "0.5",
									classname = "MELabel",
									compPath = "luacomponents.common.MEIconLabel",
									dstBlendFunc = "771",
									FontColor = "#FF32436C",
									fontName = "font/fangzheng_zhunyuan.ttf",
									fontShadow = 
									{
										IsShadow = false,
										ShadowColor = "#FFFFFFFF",
										ShadowAlpha = 255,
										OffsetX = 0,
										OffsetY = 0,
									},
									fontSize = "16",
									fontStroke = 
									{
										IsStroke = false,
										StrokeColor = "#FFE6E6E6",
										StrokeSize = 1,
									},
									height = "0",
									ignoreSize = "False",
									name = "DesLabel",
									nTextAlign = "1",
									nTextHAlign = "1",
									sizepercentx = "0",
									sizepercenty = "0",
									sizeType = "0",
									srcBlendFunc = "770",
									text = "描述",
									touchAble = "False",
									touchScaleEnable = "False",
									UILayoutViewModel = 
									{
										PositionX = 1,
										PositionY = 6,
									},
									width = "110",
									ZOrder = "1",
								},
							},
						},
						{
							controlID = "giftName_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
							UUID = "d943812a_d48f_421e_b565_ce00937c647f",
							anchorPoint = "False",
							anchorPointX = "0.5",
							anchorPointY = "0.5",
							classname = "MELabel",
							compPath = "luacomponents.common.MEIconLabel",
							dstBlendFunc = "771",
							FontColor = "#FFFFFFFF",
							fontName = "font/MFLiHei_Noncommercial.ttf",
							fontShadow = 
							{
								IsShadow = false,
								ShadowColor = "#FFFFFFFF",
								ShadowAlpha = 255,
								OffsetX = 0,
								OffsetY = 0,
							},
							fontSize = "30",
							fontStroke = 
							{
								IsStroke = true,
								StrokeColor = "#FFDB689B",
								StrokeSize = 2,
							},
							height = "40",
							ignoreSize = "True",
							name = "giftName",
							nTextAlign = "1",
							nTextHAlign = "1",
							sizepercentx = "0",
							sizepercenty = "0",
							sizeType = "0",
							srcBlendFunc = "770",
							text = "礼包名称",
							touchAble = "False",
							touchScaleEnable = "False",
							UILayoutViewModel = 
							{
								PositionX = -43,
								PositionY = -147,
							},
							width = "125",
							ZOrder = "1",
						},
						{
							controlID = "gifts_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
							UUID = "f9e95910_0c1c_455c_abe0_cf360ccf6106",
							anchorPoint = "False",
							anchorPointX = "0",
							anchorPointY = "0",
							backGroundScale9Enable = "False",
							bgColorOpacity = "50",
							bIsOpenClipping = "False",
							classname = "MEPanel",
							colorType = "0;SingleColor:#FFE6E6E6;GraduallyChangingColorStart:#FFFFFFFF;GraduallyChangingColorEnd:#FFFFFFFF;vectorX:0;vectorY:0",
							DesignHeight = "640",
							DesignType = "0",
							DesignWidth = "960",
							dstBlendFunc = "771",
							height = "0",
							ignoreSize = "False",
							name = "gifts",
							sizepercentx = "0",
							sizepercenty = "0",
							sizeType = "0",
							srcBlendFunc = "1",
							touchAble = "False",
							UILayoutViewModel = 
							{
								PositionY = -7,
							},
							uipanelviewmodel = 
							{
								Layout="Absolute",
								nType = "0"
							},
							width = "0",
							ZOrder = "1",
							components = 
							{
								
								{
									controlID = "gift1_gifts_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
									UUID = "f14e13ba_1e28_4754_9f70_f9880b1393b5",
									anchorPoint = "False",
									anchorPointX = "0.5",
									anchorPointY = "0.5",
									backGroundScale9Enable = "False",
									classname = "MEImage",
									dstBlendFunc = "771",
									height = "64",
									ignoreSize = "True",
									name = "gift1",
									sizepercentx = "0",
									sizepercenty = "0",
									sizeType = "0",
									srcBlendFunc = "1",
									touchAble = "False",
									UILayoutViewModel = 
									{
										PositionX = 37,
										PositionY = 62,
									},
									width = "64",
									ZOrder = "1",
									components = 
									{
										
										{
											controlID = "Image_pushGiftBento_1_gift1_gifts_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
											UUID = "28c6f02c_2630_4b10_b6c0_e1d2d0f4d143",
											anchorPoint = "False",
											anchorPointX = "0.5",
											anchorPointY = "0.5",
											backGroundScale9Enable = "False",
											classname = "MEImage",
											dstBlendFunc = "771",
											height = "164",
											ignoreSize = "True",
											name = "Image_pushGiftBento_1",
											sizepercentx = "0",
											sizepercenty = "0",
											sizeType = "0",
											srcBlendFunc = "1",
											texturePath = "ui/recharge/gifts/bento/6.png",
											touchAble = "False",
											UILayoutViewModel = 
											{
												PositionX = -5,
											},
											width = "196",
											ZOrder = "-1",
										},
										{
											controlID = "price_gift1_gifts_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
											UUID = "68c93779_e362_4aae_9846_5f41f7da5454",
											anchorPoint = "False",
											anchorPointX = "0.5",
											anchorPointY = "0.5",
											classname = "MELabel",
											compPath = "luacomponents.common.MEIconLabel",
											dstBlendFunc = "771",
											FontColor = "#FFFFFFFF",
											fontName = "font/MFLiHei_Noncommercial.ttf",
											fontShadow = 
											{
												IsShadow = false,
												ShadowColor = "#FFFFFFFF",
												ShadowAlpha = 255,
												OffsetX = 0,
												OffsetY = 0,
											},
											fontSize = "16",
											fontStroke = 
											{
												IsStroke = false,
												StrokeColor = "#FFE6E6E6",
												StrokeSize = 1,
											},
											height = "19",
											ignoreSize = "True",
											name = "price",
											nTextAlign = "1",
											nTextHAlign = "1",
											sizepercentx = "0",
											sizepercenty = "0",
											sizeType = "0",
											srcBlendFunc = "770",
											text = "12000",
											touchAble = "False",
											touchScaleEnable = "False",
											UILayoutViewModel = 
											{
												PositionY = -63,
											},
											width = "52",
											ZOrder = "1",
										},
									},
								},
								{
									controlID = "empty_2_gifts_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
									UUID = "9306c703_e3fe_4bb1_8b14_bbe2fb7d5880",
									anchorPoint = "False",
									anchorPointX = "0.5",
									anchorPointY = "0.5",
									backGroundScale9Enable = "False",
									classname = "MEImage",
									dstBlendFunc = "771",
									height = "164",
									ignoreSize = "True",
									name = "empty_2",
									sizepercentx = "0",
									sizepercenty = "0",
									sizeType = "0",
									srcBlendFunc = "1",
									texturePath = "ui/recharge/gifts/bento/empty.png",
									touchAble = "False",
									UILayoutViewModel = 
									{
										PositionX = 164,
										PositionY = 61,
									},
									width = "196",
									ZOrder = "1",
								},
								{
									controlID = "gift2_gifts_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
									UUID = "e3a3c189_b154_4451_b739_6b7fd2409f5c",
									anchorPoint = "False",
									anchorPointX = "0.5",
									anchorPointY = "0.5",
									backGroundScale9Enable = "False",
									classname = "MEImage",
									dstBlendFunc = "771",
									height = "64",
									ignoreSize = "True",
									name = "gift2",
									sizepercentx = "0",
									sizepercenty = "0",
									sizeType = "0",
									srcBlendFunc = "1",
									touchAble = "False",
									UILayoutViewModel = 
									{
										PositionX = 170,
										PositionY = 61,
									},
									width = "64",
									ZOrder = "1",
									components = 
									{
										
										{
											controlID = "Image_pushGiftBento_1_gift2_gifts_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
											UUID = "40ccb5df_b4f9_49ae_9664_540f4a2d4207",
											anchorPoint = "False",
											anchorPointX = "0.5",
											anchorPointY = "0.5",
											backGroundScale9Enable = "False",
											classname = "MEImage",
											dstBlendFunc = "771",
											height = "164",
											ignoreSize = "True",
											name = "Image_pushGiftBento_1",
											sizepercentx = "0",
											sizepercenty = "0",
											sizeType = "0",
											srcBlendFunc = "1",
											texturePath = "ui/recharge/gifts/bento/6.png",
											touchAble = "False",
											UILayoutViewModel = 
											{
												PositionX = -5,
											},
											width = "196",
											ZOrder = "-1",
										},
										{
											controlID = "price_gift2_gifts_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
											UUID = "4f1cf1d0_23a5_43cc_836b_9bad7c98e01b",
											anchorPoint = "False",
											anchorPointX = "0.5",
											anchorPointY = "0.5",
											classname = "MELabel",
											compPath = "luacomponents.common.MEIconLabel",
											dstBlendFunc = "771",
											FontColor = "#FFFFFFFF",
											fontName = "font/MFLiHei_Noncommercial.ttf",
											fontShadow = 
											{
												IsShadow = false,
												ShadowColor = "#FFFFFFFF",
												ShadowAlpha = 255,
												OffsetX = 0,
												OffsetY = 0,
											},
											fontSize = "16",
											fontStroke = 
											{
												IsStroke = false,
												StrokeColor = "#FFE6E6E6",
												StrokeSize = 1,
											},
											height = "19",
											ignoreSize = "True",
											name = "price",
											nTextAlign = "1",
											nTextHAlign = "1",
											sizepercentx = "0",
											sizepercenty = "0",
											sizeType = "0",
											srcBlendFunc = "770",
											text = "12000",
											touchAble = "False",
											touchScaleEnable = "False",
											UILayoutViewModel = 
											{
												PositionY = -63,
											},
											width = "52",
											ZOrder = "1",
										},
									},
								},
								{
									controlID = "empty_3_gifts_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
									UUID = "bbedaf84_cd0f_4012_8b2a_89edde6a4fa7",
									anchorPoint = "False",
									anchorPointX = "0.5",
									anchorPointY = "0.5",
									backGroundScale9Enable = "False",
									classname = "MEImage",
									dstBlendFunc = "771",
									height = "164",
									ignoreSize = "True",
									name = "empty_3",
									sizepercentx = "0",
									sizepercenty = "0",
									sizeType = "0",
									srcBlendFunc = "1",
									texturePath = "ui/recharge/gifts/bento/empty.png",
									touchAble = "False",
									UILayoutViewModel = 
									{
										PositionX = 299,
										PositionY = 58,
									},
									width = "196",
									ZOrder = "1",
								},
								{
									controlID = "gift3_gifts_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
									UUID = "143049d7_ca63_4eeb_9af2_06cbb0dabeb8",
									anchorPoint = "False",
									anchorPointX = "0.5",
									anchorPointY = "0.5",
									backGroundScale9Enable = "False",
									classname = "MEImage",
									dstBlendFunc = "771",
									height = "64",
									ignoreSize = "True",
									name = "gift3",
									sizepercentx = "0",
									sizepercenty = "0",
									sizeType = "0",
									srcBlendFunc = "1",
									touchAble = "False",
									UILayoutViewModel = 
									{
										PositionX = 304,
										PositionY = 59,
									},
									width = "64",
									ZOrder = "1",
									components = 
									{
										
										{
											controlID = "Image_pushGiftBento_1_gift3_gifts_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
											UUID = "e18b1dcf_10b5_4370_bc52_19c5e27164ae",
											anchorPoint = "False",
											anchorPointX = "0.5",
											anchorPointY = "0.5",
											backGroundScale9Enable = "False",
											classname = "MEImage",
											dstBlendFunc = "771",
											height = "164",
											ignoreSize = "True",
											name = "Image_pushGiftBento_1",
											sizepercentx = "0",
											sizepercenty = "0",
											sizeType = "0",
											srcBlendFunc = "1",
											texturePath = "ui/recharge/gifts/bento/6.png",
											touchAble = "False",
											UILayoutViewModel = 
											{
												PositionX = -5,
											},
											width = "196",
											ZOrder = "-1",
										},
										{
											controlID = "price_gift3_gifts_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
											UUID = "84d4161c_1295_4f3d_b85e_05a53063d469",
											anchorPoint = "False",
											anchorPointX = "0.5",
											anchorPointY = "0.5",
											classname = "MELabel",
											compPath = "luacomponents.common.MEIconLabel",
											dstBlendFunc = "771",
											FontColor = "#FFFFFFFF",
											fontName = "font/MFLiHei_Noncommercial.ttf",
											fontShadow = 
											{
												IsShadow = false,
												ShadowColor = "#FFFFFFFF",
												ShadowAlpha = 255,
												OffsetX = 0,
												OffsetY = 0,
											},
											fontSize = "16",
											fontStroke = 
											{
												IsStroke = false,
												StrokeColor = "#FFE6E6E6",
												StrokeSize = 1,
											},
											height = "19",
											ignoreSize = "True",
											name = "price",
											nTextAlign = "1",
											nTextHAlign = "1",
											sizepercentx = "0",
											sizepercenty = "0",
											sizeType = "0",
											srcBlendFunc = "770",
											text = "12000",
											touchAble = "False",
											touchScaleEnable = "False",
											UILayoutViewModel = 
											{
												PositionY = -63,
											},
											width = "52",
											ZOrder = "1",
										},
									},
								},
							},
						},
						{
							controlID = "btn_pay_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
							UUID = "384eb759_7b05_40e4_ad20_3c86081016f8",
							anchorPoint = "False",
							anchorPointX = "0.5",
							anchorPointY = "0.5",
							backGroundScale9Enable = "False",
							classname = "MEButton",
							ClickHighLightEnabled = "True",
							dstBlendFunc = "771",
							flipX = "False",
							flipY = "False",
							height = "155",
							ignoreSize = "True",
							name = "btn_pay",
							normal = "ui/recharge/gifts/bento/4.png",
							sizepercentx = "0",
							sizepercenty = "0",
							sizeType = "0",
							srcBlendFunc = "1",
							touchAble = "True",
							UILayoutViewModel = 
							{
								PositionX = 308,
								PositionY = -122,
							},
							UItype = "Button",
							width = "220",
							ZOrder = "1",
							components = 
							{
								
								{
									controlID = "originPrice_btn_pay_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
									UUID = "205d4f7b_b02d_45b7_b7a4_643be64e064d",
									anchorPoint = "False",
									anchorPointX = "0.5",
									anchorPointY = "0.5",
									classname = "MELabel",
									compPath = "luacomponents.common.MEIconLabel",
									dstBlendFunc = "771",
									FontColor = "#FFFFC9DC",
									fontName = "font/MFLiHei_Noncommercial.ttf",
									fontShadow = 
									{
										IsShadow = false,
										ShadowColor = "#FFFFFFFF",
										ShadowAlpha = 255,
										OffsetX = 0,
										OffsetY = 0,
									},
									fontSize = "28",
									fontStroke = 
									{
										IsStroke = false,
										StrokeColor = "#FFE6E6E6",
										StrokeSize = 1,
									},
									height = "34",
									ignoreSize = "True",
									name = "originPrice",
									nTextAlign = "1",
									nTextHAlign = "1",
									sizepercentx = "0",
									sizepercenty = "0",
									sizeType = "0",
									srcBlendFunc = "770",
									text = "200",
									touchAble = "False",
									touchScaleEnable = "False",
									UILayoutViewModel = 
									{
										PositionX = -44,
										PositionY = 38,
									},
									width = "56",
									ZOrder = "1",
									components = 
									{
										
										{
											controlID = "discountLine_originPrice_btn_pay_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
											UUID = "7d30afef_c338_4105_8fc7_df1e64f983f8",
											anchorPoint = "False",
											anchorPointX = "0.5",
											anchorPointY = "0.5",
											backGroundScale9Enable = "False",
											classname = "MEImage",
											dstBlendFunc = "771",
											height = "2",
											ignoreSize = "True",
											name = "discountLine",
											sizepercentx = "0",
											sizepercenty = "0",
											sizeType = "0",
											srcBlendFunc = "1",
											texturePath = "ui/recharge/gifts/xianshi_001.png",
											touchAble = "False",
											UILayoutViewModel = 
											{
												PositionX = 1,
												PositionY = -1,
											},
											width = "77",
											ZOrder = "1",
										},
									},
								},
								{
									controlID = "ImageDiscountTag_btn_pay_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
									UUID = "861557d0_a598_4b2c_b2d7_35eab8ea0d6c",
									anchorPoint = "False",
									anchorPointX = "0.5",
									anchorPointY = "0.5",
									backGroundScale9Enable = "False",
									classname = "MEImage",
									dstBlendFunc = "771",
									height = "76",
									ignoreSize = "True",
									name = "ImageDiscountTag",
									sizepercentx = "0",
									sizepercenty = "0",
									sizeType = "0",
									srcBlendFunc = "1",
									texturePath = "ui/recharge/gifts/bento/3.png",
									touchAble = "False",
									UILayoutViewModel = 
									{
										PositionX = 46,
										PositionY = 58,
									},
									width = "74",
									ZOrder = "1",
									components = 
									{
										
										{
											controlID = "discountTag_ImageDiscountTag_btn_pay_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
											UUID = "9c48f380_4d70_490b_a224_3ef55a147aa8",
											anchorPoint = "False",
											anchorPointX = "0.5",
											anchorPointY = "0.5",
											classname = "MELabel",
											compPath = "luacomponents.common.MEIconLabel",
											dstBlendFunc = "771",
											FontColor = "#FFFA529D",
											fontName = "font/MFLiHei_Noncommercial.ttf",
											fontShadow = 
											{
												IsShadow = false,
												ShadowColor = "#FFFFFFFF",
												ShadowAlpha = 255,
												OffsetX = 0,
												OffsetY = 0,
											},
											fontSize = "20",
											fontStroke = 
											{
												IsStroke = false,
												StrokeColor = "#FFE6E6E6",
												StrokeSize = 1,
											},
											height = "0",
											ignoreSize = "False",
											name = "discountTag",
											nTextAlign = "1",
											nTextHAlign = "1",
											sizepercentx = "0",
											sizepercenty = "0",
											sizeType = "0",
											srcBlendFunc = "770",
											text = "3折",
											touchAble = "False",
											touchScaleEnable = "False",
											UILayoutViewModel = 
											{
												PositionX = -2,
											},
											width = "64",
											ZOrder = "1",
										},
									},
								},
								{
									controlID = "discountPrice_btn_pay_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
									UUID = "cdef379d_3e14_40df_a0da_9ff7432f3405",
									anchorPoint = "False",
									anchorPointX = "0.5",
									anchorPointY = "0.5",
									classname = "MELabel",
									compPath = "luacomponents.common.MEIconLabel",
									dstBlendFunc = "771",
									FontColor = "#FFFFFFFF",
									fontName = "font/MFLiHei_Noncommercial.ttf",
									fontShadow = 
									{
										IsShadow = false,
										ShadowColor = "#FFFFFFFF",
										ShadowAlpha = 255,
										OffsetX = 0,
										OffsetY = 0,
									},
									fontSize = "45",
									fontStroke = 
									{
										IsStroke = false,
										StrokeColor = "#FFE6E6E6",
										StrokeSize = 1,
									},
									height = "54",
									ignoreSize = "True",
									name = "discountPrice",
									nTextAlign = "1",
									nTextHAlign = "1",
									sizepercentx = "0",
									sizepercenty = "0",
									sizeType = "0",
									srcBlendFunc = "770",
									text = "6",
									touchAble = "False",
									touchScaleEnable = "False",
									UILayoutViewModel = 
									{
										PositionX = -42,
										PositionY = -33,
									},
									width = "30",
									ZOrder = "1",
								},
							},
						},
						{
							controlID = "timeCount_Panel_root_Panel-pushGiftBento_Layer1_recharge_Game",
							UUID = "b11c783c_be94_46e9_a408_bdc4d09fd56f",
							anchorPoint = "False",
							anchorPointX = "0",
							anchorPointY = "0.5",
							classname = "MELabel",
							compPath = "luacomponents.common.MEIconLabel",
							dstBlendFunc = "771",
							FontColor = "#FFFFFFFF",
							fontName = "font/fangzheng_zhunyuan.ttf",
							fontShadow = 
							{
								IsShadow = false,
								ShadowColor = "#FFFFFFFF",
								ShadowAlpha = 255,
								OffsetX = 0,
								OffsetY = 0,
							},
							fontSize = "20",
							fontStroke = 
							{
								IsStroke = false,
								StrokeColor = "#FFE6E6E6",
								StrokeSize = 1,
							},
							height = "23",
							ignoreSize = "True",
							name = "timeCount",
							nTextAlign = "1",
							nTextHAlign = "1",
							sizepercentx = "0",
							sizepercenty = "0",
							sizeType = "0",
							srcBlendFunc = "770",
							text = "23:10:12 后消失",
							touchAble = "False",
							touchScaleEnable = "False",
							UILayoutViewModel = 
							{
								PositionX = 100,
								PositionY = 170,
							},
							width = "136",
							ZOrder = "1",
						},
					},
				},
			},
		},
	},
	actions = 
	{
		
	},
	respaths = 
	{
		textures = 
		{
			"ui/recharge/gifts/bento/5.png",
			"ui/recharge/gifts/bento/1.png",
			"ui/recharge/gifts/bento/2.png",
			"ui/recharge/gifts/bento/6.png",
			"ui/recharge/gifts/bento/empty.png",
			"ui/recharge/gifts/bento/4.png",
			"ui/recharge/gifts/xianshi_001.png",
			"ui/recharge/gifts/bento/3.png",
		},
		armatures = 
		{
			
		},
		movieclips = 
		{
			
		},
	},
}
return t

