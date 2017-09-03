local PuminThrone = {x=32786, y=32308, z=15}

function onStepIn(cid, item, pos, fromPosition)
	if getPlayerStorageValue(cid,356) == 2 then
		doTeleportThing(cid, PuminThrone, TRUE)
	else
		doTeleportThing(cid, fromPosition, TRUE)
		doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_ORANGE,'You do not have access to Pumin\'s Throne Room.')
	end
	return TRUE
end