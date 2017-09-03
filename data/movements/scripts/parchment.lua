function onStepIn(cid, item, pos)

local parchment = {x=33071, y=31620, z=15}

    if item.actionid == 19914 then
		doTeleportThing(cid,parchment)
        end
    return 1
end