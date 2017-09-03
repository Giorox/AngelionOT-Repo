function onAddItem(moveItem, tileItem, position, cid)
	if isPlayer(cid) then
		doRemoveItem(moveItem.uid)
		doSendMagicEffect(position, CONST_ME_EXPLOSIONHIT)
	end
end