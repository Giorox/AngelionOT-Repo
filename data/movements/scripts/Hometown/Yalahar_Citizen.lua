function onStepIn(cid, item, pos)

local thais = {x=32787, y=31276, z=7}

    if item.actionid == 30039 then
        doPlayerSetTown(cid,13) 
		doTeleportThing(cid,thais)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Yalahar")
        end
    return 1
end