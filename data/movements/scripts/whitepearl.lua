function onStepIn(cid, item, pos)

local punkt = {x=33151, y=32864, z=7}

    if item.actionid == 5630 then
		doTeleportThing(cid,punkt)
        doSendMagicEffect(getCreaturePosition(cid),14)		
        end
    return 1
end