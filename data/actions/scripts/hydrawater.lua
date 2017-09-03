function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx.actionid == 60156) then
		doTransformItem(item.uid, 5939)
	end
	return true
end