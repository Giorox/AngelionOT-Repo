function onStepIn(cid, item, pos)

local hss = {x=32886, y=32632, z=11}
local has = {x=32888, y=32632, z=11}

    if item.actionid == 32772 then
		doTeleportThing(cid,hss)
		doCreatureSay(cid, "HISSSSSSSSSSSSSSSS", TALKTYPE_ORANGE_1)
        doSendMagicEffect(getCreaturePosition(cid),20)
		doSendMagicEffect(has,20)
        end
    return 1
end