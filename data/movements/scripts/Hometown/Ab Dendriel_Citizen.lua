function onStepIn(cid, item, pos)

local thais = {x=32732, y=31634, z=7}

    if item.actionid == 30024 then
        doPlayerSetTown(cid,5) 
		doTeleportThing(cid,thais)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Ab'Dendriel")
        end
    return 1
end