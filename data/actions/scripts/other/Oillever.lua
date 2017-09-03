local bridgepos = {x=32801, y=32336, z=11, stackpos=0} -- Position of the bridge tile
local splash = {x=32800, y=32339, z=11, stackpos=1} -- Position of the liquid pool

local leverUID = 8933 -- Unique ID of the lever
local liquidId = 2016 -- Item ID of the liquid pool
local liquidType = 11 -- Subtype of the liquid pool

function onUse(cid, item, frompos, item2, topos)

local bridge = getThingfromPos(bridgepos)
local liquid = getThingfromPos(splash)

        if item.uid == leverUID and item.itemid == 1945 and bridge.itemid == 493 and liquid.itemid == 2016 then
                doTransformItem(bridge.uid, 5770)
                doSendMagicEffect(splash, CONST_ME_MAGIC_RED)
                doTransformItem(item.uid, 1946)

        elseif item.uid == leverUID and item.itemid == 1946 and bridge.itemid == 5770 then
               doPlayerSendCancel(cid, "Sorry, not possible.")
        else
                doCreatureSay(cid, "The lever is creaking and rusty.", TALKTYPE_ORANGE_1)
        end
       
        return TRUE
end