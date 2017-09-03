function onStepIn(cid, item, pos)

local tam = {x=32578, y=31405, z=15}

    if item.actionid == 14061 then
		doTeleportThing(cid,tam)
        doSendMagicEffect(getCreaturePosition(cid),17)
        end
    return 1
end