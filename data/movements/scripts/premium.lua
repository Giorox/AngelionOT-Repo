function onStepIn(cid, item, pos)
local notPremium = {x=32060, y=32192, z=7}
local notPremium2 = {x=32060, y=32193, z=7}
	if isPremium(cid) then
		doTransformItem(item.uid, 447)
	elseif (item.uid == 8800) then
		doTeleportThing(cid, notPremium)
		doSendMagicEffect(getCreaturePosition(cid), 14)
		doPlayerSendTextMessage(cid,22,"Sorry, you don't have premium account.")
	elseif (item.uid == 8801) then
		doTeleportThing(cid, notPremium2)
		doSendMagicEffect(getCreaturePosition(cid), 14)
		doPlayerSendTextMessage(cid,22,"Sorry, you don't have premium account.")
	end
end

function onStepOut(cid, item, pos)
	if item.itemid == 447 then
		doTransformItem(item.uid, 446)
	end
end