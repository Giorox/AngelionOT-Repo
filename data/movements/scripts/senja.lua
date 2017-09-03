function onStepIn(cid, item, pos)

local thais = {x=32107, y=31567, z=9}
local kurwa = {x=32189, y=31625, z=4}

    if item.actionid == 13246 then
		doTeleportThing(cid,thais)
		else
	if item.actionid == 13244 then
		doTeleportThing(cid,kurwa)
        end
    return 1
end 
end