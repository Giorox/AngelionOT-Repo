function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 3698) then
		doTransformItem(item.uid, item.itemid - 1)
	elseif(item.itemid == 3697) then
		doTransformItem(item.uid, item.itemid + 1)
	end
end