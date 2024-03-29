function onUse(cid, item, fromPosition, itemEx, toPosition)
    removals = {
        { item = 386, pos = { x = 32860 , y = 32313 , z = 11 } },   
    }
    
	local position = {x= 32860, y= 32313, z=11 }
    if item.itemid == 1945 then
        for i = 1, #removals do
            removals[i].pos.stackpos = 1
            doRemoveItem(getThingfromPos(removals[i].pos).uid, 1)
        end
        doTransformItem(item.uid, item.itemid + 1)
    elseif item.itemid == 1946 then
        for i = 1, #removals do
            doCreateItem(removals[i].item, 1, removals[i].pos)
        end
		position.stackpos = 253
		if getThingfromPos(position).itemid > 0 then
			doMoveCreature(getThingFromPos(position).uid, WEST)
		end
        doTransformItem(item.uid, item.itemid - 1)
    end
    return TRUE
end