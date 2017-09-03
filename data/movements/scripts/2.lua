function onStepIn(cid, item, pos)

local thais = {x=33213, y=32454, z=1}

    if item.actionid == 30029 then
        doPlayerSetTown(cid,10) 
		doTeleportThing(cid,thais)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Darashia")
        end
    return 1
end