local VERSES = {6087, 6088, 6089, 6090}
local verseStr = {
	[6087] = "first",
	[6088] = "second",
	[6089] = "third",
	[6090] = "fourth and last"
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.actionid == 33216 then
		if getPlayerStorageValue(cid, 6087) == 1 and getPlayerStorageValue(cid, 6088) == 1 and getPlayerStorageValue(cid, 6089) == 1 and getPlayerStorageValue(cid, 6090) == 1 then
			doSendMagicEffect(toPosition, CONST_ME_SOUND_GREEN)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x=toPosition.x-3, y=toPosition.y, z=toPosition.z}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doSendMagicEffect(fromPosition, CONST_ME_SOUND_GREEN)
			else
			doCreatureSay(cid, "You need to learn all the hymn verses.", TALKTYPE_ORANGE_1)
			return TRUE
		end
	elseif isInArray(VERSES, item.itemid) == TRUE then
		if getPlayerStorageValue(cid, item.itemid) < 1 then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_SOUND_GREEN)
			doRemoveItem(item.uid)
			setPlayerStorageValue(cid, item.itemid, 1)				
			doCreatureSay(cid, "You have learned the "..verseStr[item.itemid].." verse of a secret hymn.", TALKTYPE_ORANGE_1)
		else
			doCreatureSay(cid, "You have already learned this verse.", TALKTYPE_ORANGE_1)
		end
		return TRUE
	end
	return FALSE
end
