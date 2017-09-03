function onStepIn(cid, item, pos)

local punkt = {x=32281, y=32389, z=10}

    if item.actionid == 30049 then
		doTeleportThing(cid,punkt)
        doSendMagicEffect(getCreaturePosition(cid),14)		
        end
    return 1
end