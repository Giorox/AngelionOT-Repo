function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 8800) == EMPTY_STORAGE) then
		doPlayerAddOutfit(cid, 328, 0)
		doPlayerAddOutfit(cid, 329, 0)
		setPlayerStorageValue(cid, 8800, 1)
		doPlayerRemoveItem(cid, 10503, 1)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
	else
		doPlayerSendCancel(cid,"You already have this outfit.")
	end
	return true
end