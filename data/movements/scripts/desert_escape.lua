function onStepIn(cid, item, pos)

local escape = {x=32660, y=32113, z=8}

    if item.actionid == 12333 then
		doTeleportThing(cid,escape)
        end
    return 1
end