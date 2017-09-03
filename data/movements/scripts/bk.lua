function onStepIn(cid, item, pos)

local bk = {x=32874, y=31942, z=11}

    if item.actionid == 65535 then
		doTeleportThing(cid,bk)
        end
    return 1
end