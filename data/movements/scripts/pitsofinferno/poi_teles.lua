function onStepIn(cid, item, pos)

local thrower = {x=32725, y=32381, z=15}
local back = {x=32827, y=32241, z=12}
local go = {x=32754, y=32365, z=15}

    if item.actionid == 16773 then
		doTeleportThing(cid,thrower)
		else
	if item.actionid == 16774 then
		doTeleportThing(cid,back)
		else
		if item.actionid == 16772 then
		doTeleportThing(cid,go)
        end
    return 1
end 
end
end