function onStepIn(cid, item, pos)

local thais = {x=32302, y=31912, z=7}

    if item.actionid == 39981 then
        doPlayerSetTown(cid,4) 
		doTeleportThing(cid,thais)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of The Isle of Solitude")
        end
    return 1
end