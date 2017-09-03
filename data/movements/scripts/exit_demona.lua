function onStepIn(cid, item, pos)

local thais = {x=32492, y=31697, z=7}

    if item.actionid == 41142 then
		doTeleportThing(cid,thais)
        doSendMagicEffect(getCreaturePosition(cid),12)
        end
    return 1
end