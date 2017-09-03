function onStepIn(cid, item, pos)

local temple = {x=31914, y=32713, z=12}

    if item.actionid == 14429 then
		doTeleportThing(cid,temple)
        doSendMagicEffect(getCreaturePosition(cid),53)
        end
    return 1
end