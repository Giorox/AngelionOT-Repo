function onStepIn(cid, item, pos)

local punkt = {x=33279, y=31592, z=12}

    if item.actionid == 9933 then
		doTeleportThing(cid,punkt)
        doSendMagicEffect(getCreaturePosition(cid),14)		
        end
    return 1
end