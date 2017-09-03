function onStepIn(cid, item, pos)

local train = {x=32949, y=31181, z=9}

    if item.actionid == 32560 then
		doTeleportThing(cid,train)
        doSendMagicEffect(getCreaturePosition(cid),30)
        end
    return 1
end