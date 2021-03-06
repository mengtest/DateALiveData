return {
    ["links"] = {
        ["29AFA5CAB0DB43DEB306B1669DCF40CF"] = {
            [1] = "346AE26387534A33AE700CC67EDE00CD",
        },
        ["9819F6D899A146C68C5BA9627C8AF861"] = {
            [1] = "7587C276F0BD4A478265C83CA8F8D51C",
        },
        ["7587C276F0BD4A478265C83CA8F8D51C"] = {
            [1] = "03D26FAD21A644CBB8A665A1EB45F4FE",
        },
        ["2D6EEDDE2CE0484492D4AAA889C5CBF6"] = {
            [1] = "EB33A5DE88414BD39580766ED5745B34",
        },
        ["72367D3DC1494159967E56DCED990E69"] = {
            [1] = "C6316271D41547DD8B96C0025350AA2C",
        },
        ["E22DF53435154B17865A41884042007D"] = {
            [1] = "09644883A0224A47A108B5358198EC4A",
        },
        ["F704226FA6C74EC6A3C6BF7A0A01030D"] = {
            [1] = "938CDD5F3CED4663AB818ADA13EF3077",
            [2] = "9819F6D899A146C68C5BA9627C8AF861",
            [3] = "39784E8F64814885A0A73EABD1E87567",
            [4] = "2D6EEDDE2CE0484492D4AAA889C5CBF6",
        },
        ["F321BD80CB39463F8258E317C001B334"] = {
            [1] = "72367D3DC1494159967E56DCED990E69",
        },
        ["938CDD5F3CED4663AB818ADA13EF3077"] = {
            [1] = "132B92FCE8AB4439A5EBB2B5B7CB0A77",
        },
        ["C6316271D41547DD8B96C0025350AA2C"] = {
            [1] = "95EC79E784C84DF3A6DF296D682EC63E",
        },
        ["9C7178382C93445D8268D1EAFCEFB604"] = {
            [1] = "29AFA5CAB0DB43DEB306B1669DCF40CF",
            [2] = "E22DF53435154B17865A41884042007D",
        },
        ["95EC79E784C84DF3A6DF296D682EC63E"] = {
            [1] = "5361578039874B39A8B4C0C63561924F",
        },
        ["EB33A5DE88414BD39580766ED5745B34"] = {
            [1] = "E04DC2142EDB4410BD175EDE53FCE10D",
        },
        ["09644883A0224A47A108B5358198EC4A"] = {
            [1] = "DCA4F3DEF6194E52AF9438F2CF7267DA",
        },
        ["3009D4A685C5409F89CF3DD7EE492A41"] = {
            [1] = "BBEA30014FE0429DB1F842E9FA28B8A2",
        },
        ["9F3CC684F6CB43E1AE36C60F3A0B1748"] = {
            [1] = "CB590EF524A0438DB8EFE3031474954A",
        },
        ["CB590EF524A0438DB8EFE3031474954A"] = {
            [1] = "EEF7067D047442178CF4B1FF6948F50C",
        },
        ["7CFA9E0AA0F448AAB7870D325D68EA47"] = {
            [1] = "6C26242DE73A45DF95446B8DDC6E066B",
        },
        ["03D26FAD21A644CBB8A665A1EB45F4FE"] = {
            [1] = "713E5A9EEFE4479E937B91DA020DEE8D",
            [2] = "7CFA9E0AA0F448AAB7870D325D68EA47",
        },
        ["E04DC2142EDB4410BD175EDE53FCE10D"] = {
            [1] = "6845CF3A9C9F45968CE957B5D4CDF41B",
        },
        ["713E5A9EEFE4479E937B91DA020DEE8D"] = {
            [1] = "3009D4A685C5409F89CF3DD7EE492A41",
        },
        ["132B92FCE8AB4439A5EBB2B5B7CB0A77"] = {
            [1] = "9C7178382C93445D8268D1EAFCEFB604",
        },
        ["39784E8F64814885A0A73EABD1E87567"] = {
            [1] = "9F3CC684F6CB43E1AE36C60F3A0B1748",
        },
    },
    ["nodes"] = {
        ["EEF7067D047442178CF4B1FF6948F50C"] = {
            ["Desc"] = "行为",
            ["Weight"] = 0,
            ["NodeTag"] = "EEF7067D047442178CF4B1FF6948F50C",
            ["RunWeight"] = 0,
            ["WalkDistance"] = 0,
            ["Pos"] = {
                ["y"] = 349,
                ["x"] = 1123,
            },
            ["Class"] = "PatrolBevNode",
            ["WalkWeight"] = 0,
            ["TriggerType"] = 2,
            ["Static"] = false,
            ["Type"] = 9,
        },
        ["132B92FCE8AB4439A5EBB2B5B7CB0A77"] = {
            ["Pos"] = {
                ["y"] = 614,
                ["x"] = 701,
            },
            ["Class"] = "ConditionSelfHPLessNode",
            ["NodeTag"] = "132B92FCE8AB4439A5EBB2B5B7CB0A77",
            ["Percent"] = 50,
            ["Type"] = 4,
            ["Static"] = false,
        },
        ["9819F6D899A146C68C5BA9627C8AF861"] = {
            ["Desc"] = "普通攻击",
            ["Duration"] = 2500,
            ["NodeTag"] = "9819F6D899A146C68C5BA9627C8AF861",
            ["Force"] = 1,
            ["TriggerType"] = 0,
            ["Static"] = false,
            ["Pos"] = {
                ["y"] = 31,
                ["x"] = 394,
            },
            ["Class"] = "ChildNode",
            ["Loop"] = 0,
            ["Priority"] = 2,
        },
        ["7587C276F0BD4A478265C83CA8F8D51C"] = {
            ["Pos"] = {
                ["y"] = 33,
                ["x"] = 715,
            },
            ["Class"] = "ConditionInFightTimeoutNode",
            ["NodeTag"] = "7587C276F0BD4A478265C83CA8F8D51C",
            ["Duration"] = 2500,
            ["Type"] = 1,
            ["Static"] = false,
        },
        ["346AE26387534A33AE700CC67EDE00CD"] = {
            ["Desc"] = "施放技能",
            ["Pos"] = {
                ["y"] = 607,
                ["x"] = 1279,
            },
            ["Weight"] = 100,
            ["Class"] = "ReleaseSkillBevNode",
            ["NodeTag"] = "346AE26387534A33AE700CC67EDE00CD",
            ["ID"] = 230061,
            ["Type"] = 1,
            ["Static"] = false,
        },
        ["72367D3DC1494159967E56DCED990E69"] = {
            ["Pos"] = {
                ["y"] = 491,
                ["x"] = 662,
            },
            ["Class"] = "ConditionInFightTimeoutNode",
            ["NodeTag"] = "72367D3DC1494159967E56DCED990E69",
            ["Duration"] = 5000,
            ["Type"] = 1,
            ["Static"] = false,
        },
        ["6C26242DE73A45DF95446B8DDC6E066B"] = {
            ["Desc"] = "施放技能",
            ["Pos"] = {
                ["y"] = -75,
                ["x"] = 1364,
            },
            ["Weight"] = 50,
            ["Class"] = "ReleaseSkillBevNode",
            ["NodeTag"] = "6C26242DE73A45DF95446B8DDC6E066B",
            ["ID"] = 230030,
            ["Type"] = 1,
            ["Static"] = false,
        },
        ["DCA4F3DEF6194E52AF9438F2CF7267DA"] = {
            ["Desc"] = "施放技能",
            ["Pos"] = {
                ["y"] = 708,
                ["x"] = 1453,
            },
            ["Weight"] = 0,
            ["Class"] = "ReleaseSkillBevNode",
            ["NodeTag"] = "DCA4F3DEF6194E52AF9438F2CF7267DA",
            ["ID"] = 230061,
            ["Type"] = 1,
            ["Static"] = false,
        },
        ["E22DF53435154B17865A41884042007D"] = {
            ["Desc"] = "行为",
            ["LimitArea"] = 50,
            ["Weight"] = 10,
            ["NodeTag"] = "E22DF53435154B17865A41884042007D",
            ["RangeOrigin"] = {
                ["y"] = -15,
                ["x"] = -160,
            },
            ["RunWeight"] = 0,
            ["Static"] = false,
            ["FixTarget"] = 0,
            ["Pos"] = {
                ["y"] = 708,
                ["x"] = 1097,
            },
            ["Class"] = "PathfindingBevNode",
            ["WalkWeight"] = 0,
            ["RangeSize"] = {
                ["height"] = 30,
                ["width"] = 320,
            },
            ["WalkDistance"] = 0,
            ["Type"] = 0,
        },
        ["09644883A0224A47A108B5358198EC4A"] = {
            ["Desc"] = "施放技能",
            ["Pos"] = {
                ["y"] = 711,
                ["x"] = 1273,
            },
            ["Weight"] = 0,
            ["Class"] = "ReleaseSkillBevNode",
            ["NodeTag"] = "09644883A0224A47A108B5358198EC4A",
            ["ID"] = 230056,
            ["Type"] = 1,
            ["Static"] = false,
        },
        ["F704226FA6C74EC6A3C6BF7A0A01030D"] = {
            ["Desc"] = "新的 AI",
            ["Pos"] = {
                ["y"] = 359,
                ["x"] = 132,
            },
            ["Category"] = 3,
            ["Class"] = "RootNode",
            ["NodeTag"] = "F704226FA6C74EC6A3C6BF7A0A01030D",
            ["ID"] = "2030",
            ["Name"] = "机械高阶近战",
            ["Static"] = true,
        },
        ["F321BD80CB39463F8258E317C001B334"] = {
            ["Desc"] = "施放技能",
            ["Duration"] = 8000,
            ["NodeTag"] = "F321BD80CB39463F8258E317C001B334",
            ["Force"] = 1,
            ["TriggerType"] = 0,
            ["Static"] = false,
            ["Pos"] = {
                ["y"] = 483,
                ["x"] = 386,
            },
            ["Class"] = "ChildNode",
            ["Loop"] = 0,
            ["Priority"] = 3,
        },
        ["938CDD5F3CED4663AB818ADA13EF3077"] = {
            ["Desc"] = "子节点",
            ["Duration"] = 7000,
            ["NodeTag"] = "938CDD5F3CED4663AB818ADA13EF3077",
            ["Force"] = 1,
            ["TriggerType"] = 0,
            ["Static"] = false,
            ["Pos"] = {
                ["y"] = 607,
                ["x"] = 399,
            },
            ["Class"] = "ChildNode",
            ["Loop"] = 0,
            ["Priority"] = 4,
        },
        ["03D26FAD21A644CBB8A665A1EB45F4FE"] = {
            ["Desc"] = "随机行为",
            ["Pos"] = {
                ["y"] = 14,
                ["x"] = 984,
            },
            ["Weight"] = 0,
            ["Class"] = "RandomBevNode",
            ["NodeTag"] = "03D26FAD21A644CBB8A665A1EB45F4FE",
            ["Type"] = 0,
            ["Static"] = false,
        },
        ["C6316271D41547DD8B96C0025350AA2C"] = {
            ["Desc"] = "顺序行为",
            ["Pos"] = {
                ["y"] = 483,
                ["x"] = 961,
            },
            ["Weight"] = 0,
            ["Class"] = "OrderBevNode",
            ["NodeTag"] = "C6316271D41547DD8B96C0025350AA2C",
            ["Type"] = 0,
            ["Static"] = false,
        },
        ["BBEA30014FE0429DB1F842E9FA28B8A2"] = {
            ["Desc"] = "施放技能",
            ["Pos"] = {
                ["y"] = 77,
                ["x"] = 1550,
            },
            ["Weight"] = 0,
            ["Class"] = "ReleaseSkillBevNode",
            ["NodeTag"] = "BBEA30014FE0429DB1F842E9FA28B8A2",
            ["ID"] = 230030,
            ["Type"] = 1,
            ["Static"] = false,
        },
        ["7CFA9E0AA0F448AAB7870D325D68EA47"] = {
            ["Desc"] = "行为",
            ["LimitArea"] = 50,
            ["Weight"] = 10,
            ["NodeTag"] = "7CFA9E0AA0F448AAB7870D325D68EA47",
            ["RangeOrigin"] = {
                ["y"] = -15,
                ["x"] = -160,
            },
            ["RunWeight"] = 0,
            ["Static"] = false,
            ["FixTarget"] = 0,
            ["Pos"] = {
                ["y"] = -73,
                ["x"] = 1168,
            },
            ["Class"] = "PathfindingBevNode",
            ["WalkWeight"] = 0,
            ["RangeSize"] = {
                ["height"] = 30,
                ["width"] = 320,
            },
            ["WalkDistance"] = 0,
            ["Type"] = 0,
        },
        ["9C7178382C93445D8268D1EAFCEFB604"] = {
            ["Desc"] = "随机行为",
            ["Pos"] = {
                ["y"] = 610,
                ["x"] = 921,
            },
            ["Weight"] = 0,
            ["Class"] = "RandomBevNode",
            ["NodeTag"] = "9C7178382C93445D8268D1EAFCEFB604",
            ["Type"] = 0,
            ["Static"] = false,
        },
        ["95EC79E784C84DF3A6DF296D682EC63E"] = {
            ["Desc"] = "行为",
            ["LimitArea"] = 50,
            ["Weight"] = 0,
            ["NodeTag"] = "95EC79E784C84DF3A6DF296D682EC63E",
            ["RangeOrigin"] = {
                ["y"] = -15,
                ["x"] = -200,
            },
            ["RunWeight"] = 0,
            ["Static"] = false,
            ["FixTarget"] = 0,
            ["Pos"] = {
                ["y"] = 451,
                ["x"] = 1133,
            },
            ["Class"] = "PathfindingBevNode",
            ["WalkWeight"] = 0,
            ["RangeSize"] = {
                ["height"] = 30,
                ["width"] = 400,
            },
            ["WalkDistance"] = 0,
            ["Type"] = 0,
        },
        ["EB33A5DE88414BD39580766ED5745B34"] = {
            ["Pos"] = {
                ["y"] = 201,
                ["x"] = 696,
            },
            ["Class"] = "ConditionInFightTimeoutNode",
            ["NodeTag"] = "EB33A5DE88414BD39580766ED5745B34",
            ["Duration"] = 0,
            ["Type"] = 1,
            ["Static"] = false,
        },
        ["39784E8F64814885A0A73EABD1E87567"] = {
            ["Desc"] = "巡逻",
            ["Duration"] = 0,
            ["NodeTag"] = "39784E8F64814885A0A73EABD1E87567",
            ["Force"] = 0,
            ["TriggerType"] = 0,
            ["Static"] = false,
            ["Pos"] = {
                ["y"] = 327,
                ["x"] = 389,
            },
            ["Class"] = "ChildNode",
            ["Loop"] = 1,
            ["Priority"] = 1,
        },
        ["3009D4A685C5409F89CF3DD7EE492A41"] = {
            ["Desc"] = "施放技能",
            ["Pos"] = {
                ["y"] = 119,
                ["x"] = 1357,
            },
            ["Weight"] = 100,
            ["Class"] = "ReleaseSkillBevNode",
            ["NodeTag"] = "3009D4A685C5409F89CF3DD7EE492A41",
            ["ID"] = 230056,
            ["Type"] = 1,
            ["Static"] = false,
        },
        ["9F3CC684F6CB43E1AE36C60F3A0B1748"] = {
            ["Pos"] = {
                ["y"] = 341,
                ["x"] = 669,
            },
            ["Class"] = "ConditionInFightTimeoutNode",
            ["NodeTag"] = "9F3CC684F6CB43E1AE36C60F3A0B1748",
            ["Duration"] = 0,
            ["Type"] = 1,
            ["Static"] = false,
        },
        ["CB590EF524A0438DB8EFE3031474954A"] = {
            ["Desc"] = "顺序行为",
            ["Pos"] = {
                ["y"] = 340,
                ["x"] = 936,
            },
            ["Weight"] = 0,
            ["Class"] = "OrderBevNode",
            ["NodeTag"] = "CB590EF524A0438DB8EFE3031474954A",
            ["Type"] = 0,
            ["Static"] = false,
        },
        ["6845CF3A9C9F45968CE957B5D4CDF41B"] = {
            ["Desc"] = "行为",
            ["Weight"] = 0,
            ["NodeTag"] = "6845CF3A9C9F45968CE957B5D4CDF41B",
            ["RunWeight"] = 0,
            ["WalkDistance"] = 0,
            ["Pos"] = {
                ["y"] = 205,
                ["x"] = 1122,
            },
            ["Class"] = "PatrolBevNode",
            ["WalkWeight"] = 0,
            ["TriggerType"] = 2,
            ["Static"] = false,
            ["Type"] = 9,
        },
        ["29AFA5CAB0DB43DEB306B1669DCF40CF"] = {
            ["Desc"] = "行为",
            ["LimitArea"] = 50,
            ["Weight"] = 20,
            ["NodeTag"] = "29AFA5CAB0DB43DEB306B1669DCF40CF",
            ["RangeOrigin"] = {
                ["y"] = -15,
                ["x"] = -200,
            },
            ["RunWeight"] = 0,
            ["Static"] = false,
            ["FixTarget"] = 0,
            ["Pos"] = {
                ["y"] = 610,
                ["x"] = 1104,
            },
            ["Class"] = "PathfindingBevNode",
            ["WalkWeight"] = 0,
            ["RangeSize"] = {
                ["height"] = 30,
                ["width"] = 400,
            },
            ["WalkDistance"] = 0,
            ["Type"] = 0,
        },
        ["2D6EEDDE2CE0484492D4AAA889C5CBF6"] = {
            ["Desc"] = "巡逻",
            ["Duration"] = 2000,
            ["NodeTag"] = "2D6EEDDE2CE0484492D4AAA889C5CBF6",
            ["Force"] = 0,
            ["TriggerType"] = 0,
            ["Static"] = false,
            ["Pos"] = {
                ["y"] = 172,
                ["x"] = 405,
            },
            ["Class"] = "ChildNode",
            ["Loop"] = 0,
            ["Priority"] = 1,
        },
        ["713E5A9EEFE4479E937B91DA020DEE8D"] = {
            ["Desc"] = "行为",
            ["LimitArea"] = 50,
            ["Weight"] = 10,
            ["NodeTag"] = "713E5A9EEFE4479E937B91DA020DEE8D",
            ["RangeOrigin"] = {
                ["y"] = -15,
                ["x"] = -160,
            },
            ["RunWeight"] = 0,
            ["Static"] = false,
            ["FixTarget"] = 0,
            ["Pos"] = {
                ["y"] = 91,
                ["x"] = 1154,
            },
            ["Class"] = "PathfindingBevNode",
            ["WalkWeight"] = 0,
            ["RangeSize"] = {
                ["height"] = 30,
                ["width"] = 320,
            },
            ["WalkDistance"] = 0,
            ["Type"] = 0,
        },
        ["5361578039874B39A8B4C0C63561924F"] = {
            ["Desc"] = "施放技能",
            ["Pos"] = {
                ["y"] = 460,
                ["x"] = 1282,
            },
            ["Weight"] = 100,
            ["Class"] = "ReleaseSkillBevNode",
            ["NodeTag"] = "5361578039874B39A8B4C0C63561924F",
            ["ID"] = 230050,
            ["Type"] = 1,
            ["Static"] = false,
        },
        ["E04DC2142EDB4410BD175EDE53FCE10D"] = {
            ["Desc"] = "顺序行为",
            ["Pos"] = {
                ["y"] = 210,
                ["x"] = 952,
            },
            ["Weight"] = 0,
            ["Class"] = "OrderBevNode",
            ["NodeTag"] = "E04DC2142EDB4410BD175EDE53FCE10D",
            ["Type"] = 0,
            ["Static"] = false,
        },
    },
    ["root"] = "F704226FA6C74EC6A3C6BF7A0A01030D",
}