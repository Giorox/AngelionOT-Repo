local SUGARCANE = {5465, 5466}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if(isInArray(SUGARCANE, itemEx.itemid)) then
		doTransformItem(itemEx.uid, itemEx.itemid -1)
		doDecayItem(itemEx.uid)
		doSendMagicEffect(toPosition, 5)
		return true
	elseif(itemEx.actionid == 33227) and (itemEx.itemid == 2249) then
		local tp = doTransformItem(itemEx.uid, 1387)
		doSendMagicEffect({x=32848, y=32232, z=9}, 5)
		doSendMagicEffect({x=32849, y=32232, z=9}, 5)
		doSendMagicEffect({x=32849, y=32233, z=9}, 5)
		doSendMagicEffect({x=32850, y=32231, z=9}, 5)
		doSendMagicEffect({x=32849, y=32231, z=9}, 5)
		doSendMagicEffect({x=32848, y=32231, z=9}, 5)
		doSendMagicEffect({x=32847, y=32231, z=9}, 5)
		doSendMagicEffect({x=32848, y=32230, z=9}, 5)
		doSendMagicEffect({x=32849, y=32230, z=9}, 5)
		return true
	else
		doPlayerSendCancel(cid,21,"You already burned the sugar cane.")
	end

	return destroyItem(cid, itemEx, toPosition)

end
