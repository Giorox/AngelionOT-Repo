function onStepIn(cid, item, pos)

local thais = {x=32595, y=32744, z=6}

    if item.actionid == 30031 then
        doPlayerSetTown(cid,8) 
		doTeleportThing(cid,thais)
        doSendMagicEffect(getCreaturePosition(cid),12)
		doPlayerSendTextMessage(cid,22, "You are now a citizen of Port Hope")
        end
    return 1
end