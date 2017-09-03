function onStepIn(cid, item, pos)

local punkt = {x=32232, y=32276, z=9}

    if item.actionid == 47486 then
		doTeleportThing(cid,punkt)
        doSendMagicEffect(getCreaturePosition(cid),14)		
        end
    return 1
end