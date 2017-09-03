local verse =
{
	[6087] = {15, "You have learned the first part of a hymn."},
	[6088] = {15, "You have learned the second part of a hymn."},
	[6089] = {15, "You have learned the third part of a hymn."},
	[6090] = {15, "You have learned the fourth part of a hymn."}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(not verse[item.itemid]) then
		return FALSE
	else
		doCreatureSay(cid, verse[item.itemid][2], TALKTYPE_ORANGE_1)
doSendMagicEffect(getPlayerPosition(cid), 23)
		doRemoveItem(item.uid, 1)
	end

	return TRUE
end