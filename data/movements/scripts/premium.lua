function onStepIn(cid, item, pos)
local niema = {x=1060, y=1193, z=7} -- mozna pominac i zrobic tak aby teleportowalo gracza pietro nizej (jak most na rooku)
	if isPremium(cid) then
		doTransformItem(item.uid, 447)
	else
		doTeleportThing(cid, niema)
		doSendMagicEffect(getCreaturePosition(cid), 14)
		doPlayerSendTextMessage(cid,22,"Sorry, you don't have premium account.")
	end
end

function onStepOut(cid, item, pos)
	if item.itemid == 425 then
		doTransformItem(item.uid, 446)
	end
end