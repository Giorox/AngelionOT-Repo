function onStepIn(cid, item, pos)

local thais = {x=32317, y=32826, z=7}

    if item.actionid == 30030 then
        doPlayerSetTown(cid,7) 
		doTeleportThing(cid,thais)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Liberty Bay")
        end
    return 1
end