local t = {
	[62375] = {{x=32886, y=32632, z=11}},
	[62376] = {{x=32892, y=32632, z=11}, "You discovered a secret tunnel."},
	[62377] = {{x=32858, y=32666, z=9}, "You entered the tunnel to deeper Banuta."}
}
function onStepIn(cid, item, position, fromPosition)
	if getPlayerStorageValue(cid, 62378) == 1 then
		local v = t[item.actionid]
		doTeleportThing(cid, v[1])
		doSendMagicEffect(v[1], CONST_ME_POISONAREA)
		doSendMagicEffect(v[1], CONST_ME_TELEPORT)
		doSendMagicEffect(position, CONST_ME_POISONAREA)
		doSendMagicEffect(position, CONST_ME_TELEPORT)
		if v[2] then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, v[2])
		end
	else
		doTeleportThing(cid, fromPosition, true)
	end
end