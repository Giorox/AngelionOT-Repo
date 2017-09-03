local t = {
	interval = 2,
	itemID = 2166,
	itempos = {x=32594, y=32214, z=9},
	wallpos = {x=32604, y=32216, z=9},
	wallnewID = 1026
}
local event = 0
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local getitem, wallchk = getTileItemById(t.itempos, 2166).uid, getTileItemById(t.wallpos, 1026).uid
	if item.itemid == 1945 then
		if getitem > 0 and wallchk > 0 then
			doSendMagicEffect(t.itempos, CONST_ME_TELEPORT)
			doSendMagicEffect(t.wallpos, CONST_ME_TELEPORT)
			doRemoveItem(getitem)
			doRemoveItem(wallchk)
			doTransformItem(item.uid, 1946)
			event = addEvent(doCreateItem, t.interval * 60 * 1000, t.wallnewID, 1, t.wallpos)
		else
			doPlayerSendCancel(cid, "There is something missing.")
		end
	elseif item.itemid == 1946 then
		stopEvent(event)
		doCreateItem(t.wallnewID, 1, t.wallpos)
		doTransformItem(item.uid, 1945)
	end
	return TRUE
end
