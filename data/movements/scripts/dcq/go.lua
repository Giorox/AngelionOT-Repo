function onStepIn(cid, item, pos)

local go1 = {x=32857, y=32234, z=11}

    if(item.actionid == 33227) and (item.itemid == 1387) then
		doTeleportThing(cid,go1)
        doSendMagicEffect(getCreaturePosition(cid),12)
		local tp = doTransformItem(item.uid, 2249)
        end
    return 1
end