function onAddItem(moveItem, tileItem, position, cid)
	for i = 2335, 2341 do
		if getTileItemById(position, i).uid < 1 then return end
	end
	for i = 2335, 2341 do
		doRemoveItem(getTileItemById(position, i).uid)
	end
	doCreateItem(2342, 1, position)
	doSendMagicEffect(position, CONST_ME_FIREAREA)
end