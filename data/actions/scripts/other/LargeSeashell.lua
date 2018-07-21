local wait = {
	storage = 2670, -- Storage key where time status will be stored.
	_time = 20 * 3600 -- Time to wait to open another seashell.
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	local random = math.random(1,100)

	if(not exhaustion.get(cid, wait.storage)) then
		if(random < 35) then
			doTransformItem(item.uid, item.itemid + 1)
			doSendMagicEffect(toPosition, 25)
			doCreatureSay(cid, "Nothing is inside.", TALKTYPE_ORANGE_1, nil, nil, fromPosition)
			exhaustion.set(cid, wait.storage, wait._time)
			return true
		elseif(random < 65) then
			doTransformItem(item.uid, item.itemid + 1)
			doSendMagicEffect(toPosition, 25)
			doCreatureSay(cid, "You found a beautiful pearl.", TALKTYPE_ORANGE_1, nil, nil, fromPosition)
			doPlayerAddItem(cid, 7632, 1)
			exhaustion.set(cid, wait.storage, wait._time)
			return true
		elseif(random < 83) then
			doTransformItem(item.uid, item.itemid + 1)
			doSendMagicEffect(toPosition, 25)
			doCreatureSay(cid, "You found a beautiful pearl.", TALKTYPE_ORANGE_1, nil, nil, fromPosition)
			doPlayerAddItem(cid, 7633, 1)
			exhaustion.set(cid, wait.storage, wait._time)
			return true
		else
			doTransformItem(item.uid, item.itemid + 1)
			doSendMagicEffect(toPosition, 25)
			doCreatureSay(cid, "Ouch! You squeezed your fingers.", TALKTYPE_ORANGE_1, nil, nil, fromPosition)
			doCreatureAddHealth(cid, -200)
			exhaustion.set(cid, wait.storage, wait._time)
			return true
		end
	else
		doPlayerSendCancel(cid, "Sorry, not possible.")
	end

end
