function onStepIn(cid, item, pos)

local go1 = {x=32875, y=32274, z=14}

    if(item.actionid == 2222) and (item.itemid == 1387) then
		doTeleportThing(cid,go1)
        doSendMagicEffect(getCreaturePosition(cid),12)
		local tp = doRemoveItem(item.uid, 1387)
        end
    return 1
end