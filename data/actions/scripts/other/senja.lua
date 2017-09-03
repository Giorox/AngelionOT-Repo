function onUse(cid, item, fromPosition, itemEx, toPosition)
    removals = { --Magic Walls
        { x = 32186 , y = 31626 , z = 8, stackpos = 1 },
        { x = 32187 , y = 31626 , z = 8, stackpos = 1 },
        { x = 32188 , y = 31626 , z = 8, stackpos = 1 },
        { x = 32189 , y = 31626 , z = 8, stackpos = 1 }
    }
    
     if item.itemid == 1945 then
        for i = 1, #removals do
            doRemoveItem(getThingfromPos(removals[i]).uid, 1)
        end
		local LeverPos = {x=32180, y=31633, z=8}
		doSendMagicEffect(LeverPos, CONST_ME_POFF)
		doRemoveItem(item.uid, 1)
		addEvent(reCreate, 600*1000)
	end	
    return TRUE
end

function reCreate()
	for i = 1, #removals do
	removals[i].stackpos = 253
		if getThingfromPos(removals[i]).itemid > 0 then
			doMoveCreature(getThingFromPos(removals[i]).uid, SOUTH)
		end
	removals[i].stackpos = 1
		doCreateItem(1498, 1, removals[i])
	end
	local LeverPos = {x=32180, y=31633, z= 8}
	local cr = doCreateItem(1945, 1, LeverPos)
	local rc = doCreateItem(1492, 1, LeverPos)
	doSetItemActionId(cr, 56222)
  return TRUE
end