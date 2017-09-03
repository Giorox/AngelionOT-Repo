function onUse(cid, item, fromPosition, itemEx, toPosition)
    removals = {
        { item = 1304, pos = { x = 32849 , y = 32282 , z = 10 } },   
    }
    local poss = { x = 32849 , y = 32282 , z = 10 }
    if item.itemid == 1945 then
        for i = 1, #removals do
            removals[i].pos.stackpos = 1
            doRemoveItem(getThingfromPos(removals[i].pos).uid, 1)
			doSendMagicEffect(poss,2)
        end
        doTransformItem(item.uid, item.itemid + 1)
    elseif item.itemid == 1946 then
        for i = 1, #removals do
            doCreateItem(removals[i].item, 1, removals[i].pos)
			doSendMagicEffect(poss,2)
        end
		poss.stackpos = 253
		if getThingFromPos(poss).itemid > 0 then
		doMoveCreature(getThingFromPos(poss).uid, EAST)
		end
        doTransformItem(item.uid, item.itemid - 1)
    end
    return TRUE
end