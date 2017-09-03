local quest_storage = 17935

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, quest_storage) == 14) then
		doSendMagicEffect(fromPosition, CONST_ME_HOLYAREA)
		doCreatureSay(cid, 'A ray of sunlight comes down from the heaven and hits the crystal. Wow. That probably means Fasuon is supporting.', TALKTYPE_ORANGE_1)
		doPlayerSetStorageValue(cid, quest_storage, 15)	-- completed
	end
	return true
end