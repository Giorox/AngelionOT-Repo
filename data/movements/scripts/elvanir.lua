function onStepIn(cid, item, pos)

local train = {x=33229, y=31771, z=9}

    if item.actionid == 19911 then
		doTeleportThing(cid,train)
        end
    return 1
end