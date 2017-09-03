function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 4767) == EMPTY_STORAGE) then
		doCreatureSay(cid, "You have gained your new outfit and may leave the reward room now!", TALKTYPE_ORANGE_1)
		doPlayerAddOutfit(cid, 336, 0)
		doPlayerAddOutfit(cid, 335, 0)
		setPlayerStorageValue(cid, 4767, 1)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYDAMAGE)
	else
		doPlayerSendTextMessage(cid,22,"You have already gained your new outfit. You may leave the room now.")
	end
	return true
end