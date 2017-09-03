function onStepIn(cid, item, pos)

local bk = {x=32819, y=32344, z=6}

    if item.actionid == 14171 then
		doTeleportThing(cid,bk)
        end
    return 1
end