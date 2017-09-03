function onStepIn(cid, item, pos)

local punkt = {x=32167, y=32438, z=9}

    if item.actionid == 30081 then
		doTeleportThing(cid,punkt)
        doSendMagicEffect(getCreaturePosition(cid),14)		
        end
    return 1
end