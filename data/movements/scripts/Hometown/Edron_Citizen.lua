function onStepIn(cid, item, pos)

local thais = {x=33217, y=31814, z=8}

    if item.actionid == 30028 then
        doPlayerSetTown(cid,11) 
		doTeleportThing(cid,thais)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Edron")
        end
    return 1
end