function onStepIn(cid, item, pos)

local bk = {x=32874, y=31953, z=12}

    if item.actionid == 1453 then
		doTeleportThing(cid,bk)
        end
    return 1
end