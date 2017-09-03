function onStepIn(cid, item, pos)

local poh = {x=32836, y=32294, z=7}

    if item.actionid == 7449 then 
		doTeleportThing(cid,poh)
        end
    return 1
end