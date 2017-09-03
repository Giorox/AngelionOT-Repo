function onStepIn(cid, item, pos)

local thais = {x=32649, y=31925, z=11}

    if item.actionid == 30023 then
        doPlayerSetTown(cid,3) 
		doTeleportThing(cid,thais)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Kazordoon")
        end
    return 1
end