function onStepIn(cid, item, pos)

local thais = {x=33023, y=31521, z=11}

    if item.actionid == 30016 then
        doPlayerSetTown(cid,14) 
		doTeleportThing(cid,thais)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Farmine")
        end
    return 1
end