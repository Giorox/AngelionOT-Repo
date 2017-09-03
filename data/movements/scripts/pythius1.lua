function onAddItem(moveitem, tileitem, position)
	if tileitem.itemid == 7655 then
		doRemoveItem(moveitem.uid,1)
		doTransformItem(tileitem.uid,tileitem.itemid+10)
		doSendMagicEffect(position,CONST_ME_MAGIC_BLUE)
	end
	return 1
end