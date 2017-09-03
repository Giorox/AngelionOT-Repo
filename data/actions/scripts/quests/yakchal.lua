--Copyright to teckman
local config = {
random = math.random(1,6), -- random of the destruction of frozen starlight
starid = 2361,  -- id of frozen starlight
tombid = 7362, -- id of the tomb (you use starlight on it)
storage = 4358, -- storage of blocking quest (one wawaking per 15 mins)
bosspos = {
{x=32204,y=30987,z=14}, -- position where yakchal first spawns
{x=32199,y=31004,z=14} -- position where yakchal is teleported (after some time)
},
effectpos = {
{x=32204,y=31001,z=14}, -- positions of effect (surrounding the sarcophagus)
{x=32006,y=31001,z=14},
{x=32204,y=31002,z=14},
{x=32206,y=31002,z=14}
},
boss = "yakchal", -- name of the boss
monsters = {
"ice witch", -- monsters which are summoned
"ice golem",
"crystal spider",
"frost dragon"
},
poses = {
{x=32196,y=30998,z=14}, -- posses of monster summons
{x=32198,y=30994,z=14},
{x=32208,y=31004,z=14},
{x=32213,y=30996,z=14},
{x=32216,y=30997,z=14},
{x=32204,y=30990,z=14}
},
poses2 = {
{x=32192,y=31010,z=14},
{x=32197,y=31013,z=14},
{x=32215,y=31004,z=14},
{x=32212,y=30997,z=14},
{x=32210,y=30994,z=14},
{x=32211,y=30992,z=14},
{x=32208,y=30990,z=14},
{x=32200,y=30990,z=14},
{x=32194,y=30990,z=14},
{x=32206,y=30986,z=14},
},
poses1 = {
{x=32196,y=30988,z=14},
{x=32200,y=30991,z=14},
{x=32197,y=31013,z=14},
{x=32192,y=31010,z=14},
{x=32192,y=31000,z=14},
{x=32212,y=30996,z=14},
{x=32212,y=30997,z=14},
{x=32200,y=30990,z=14},
{x=32210,y=31004,z=14},
{x=32205,y=30989,z=14},
{x=32201,y=31007,z=14},
{x=32217,y=31001,z=14},
{x=32209,y=30984,z=14},
{x=32208,y=30990,z=14},
},
messages = {
"The frozen starlight shattered, but you have awoken the icewitch Yakchal from her slumber! She seems not amused ...",
"You have awoken the icewitch Yakchal from her slumber! She seems not amused ..."
}
}
function FirstAttack()
    doSummonCreature(config.monsters[2], config.poses[1])
    doSummonCreature(config.monsters[2], config.poses[2])
    doSummonCreature(config.monsters[1], config.poses[3])
    doSummonCreature(config.monsters[3], config.poses[4])
    doSummonCreature(config.monsters[3], config.poses[5])
    doSummonCreature(config.monsters[1], config.poses[6])
end
function SecondAttack()
    doSummonCreature(config.monsters[2], config.poses2[1])
    doSummonCreature(config.monsters[2], config.poses2[2])
    doSummonCreature(config.monsters[1], config.poses2[3])
    doSummonCreature(config.monsters[3], config.poses2[4])
    doSummonCreature(config.monsters[3], config.poses2[5])
    doSummonCreature(config.monsters[1], config.poses2[6])
    doSummonCreature(config.monsters[2], config.poses2[7])
    doSummonCreature(config.monsters[3], config.poses2[8])
    doSummonCreature(config.monsters[1], config.poses2[9])
    doSummonCreature(config.monsters[3], config.poses2[10])
end
function ThirdAttack()
    doSummonCreature(config.monsters[4], config.poses1[1])
    doSummonCreature(config.monsters[4], config.poses1[2])
    doSummonCreature(config.monsters[1], config.poses1[3])
    doSummonCreature(config.monsters[3], config.poses1[4])
    doSummonCreature(config.monsters[3], config.poses1[5])
    doSummonCreature(config.monsters[1], config.poses1[6])
    doSummonCreature(config.monsters[2], config.poses1[7])
    doSummonCreature(config.monsters[3], config.poses1[8])
    doSummonCreature(config.monsters[1], config.poses1[9])
    doSummonCreature(config.monsters[3], config.poses1[10])
    doSummonCreature(config.monsters[2], config.poses1[11])
    doSummonCreature(config.monsters[3], config.poses1[12])
    doSummonCreature(config.monsters[1], config.poses1[13])
    doSummonCreature(config.monsters[3], config.poses1[14])
end
function YakchalAttack()
    yakchalpos = {x=32204,y=30987,z=14,stackpos= STACKPOS_TOP_CREATURE}
    getyakchal = getThingFromPos(yakchalpos)
    doTeleportThing(getyakchal.uid, config.bosspos[2], FALSE)
    doSendMagicEffect(config.bosspos[2], CONST_ME_TELEPORT)
    doSendMagicEffect(config.bosspos[1], CONST_ME_TELEPORT)
end
function doQuest()
  setGlobalStorageValue(cid, 4358, -1)
end
function onUse(cid, item, fromPosition, itemEx, toPosition)

if itemEx.itemid == config.tombid and item.itemid == config.starid then 
if getGlobalStorageValue(4358) == -1 then
    if math.random(1,6) == 6 then
        doCreatureSay(cid, config.messages[1], TALKTYPE_ORANGE_1)
        doPlayerRemoveItem(cid,2361,1)
    elseif math.random(1,6) < 6 then
        doCreatureSay(cid, config.messages[2], TALKTYPE_ORANGE_1)
    end
    doSummonCreature(config.boss, config.bosspos[1])
    setGlobalStorageValue(4358, 1)
    addEvent(doQuest, 90000)
    addEvent(FirstAttack, 7000)
    addEvent(SecondAttack, 14000)
    addEvent(ThirdAttack, 19000)
    addEvent(YakchalAttack, 19500)
    for i = 1, table.maxn(config.effectpos) do
        doSendMagicEffect(config.effectpos[i], 30)
    end
else
    doPlayerSendCancel(cid,"You can not use this object.")
end
end
return TRUE
end  