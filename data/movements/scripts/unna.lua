local quest_storage = 17935
local center_pos = {x = 32991, y = 31497, z = 1}
local positions =
	{
		[1] = {x = center_pos.x - 1, y = center_pos.y - 1, z = center_pos.z},
		[2] = {x = center_pos.x, y = center_pos.y - 1, z = center_pos.z},
		[3] = {x = center_pos.x + 1, y = center_pos.y - 1, z = center_pos.z},
		[4] = {x = center_pos.x - 1, y = center_pos.y, z = center_pos.z},
		[5] = {x = center_pos.x, y = center_pos.y, z = center_pos.z},
		[6] = {x = center_pos.x + 1, y = center_pos.y, z = center_pos.z},
		[7] = {x = center_pos.x - 1, y = center_pos.y + 1, z = center_pos.z},
		[8] = {x = center_pos.x, y = center_pos.y + 1, z = center_pos.z},
		[9] = {x = center_pos.x + 1, y = center_pos.y + 1, z = center_pos.z}
	}

local dances = {}

local order = {5, 7, 5, 9, 5, 8, 4, 2, 6, 2, 5, 1, 5, 3, 5, 2}	-- this is the real order based on wikia

function onStepIn(cid, item, position, fromPosition)
	if not isPlayer(cid) or (getPlayerStorageValue(cid, quest_storage) ~= 9) then
		return true
	end
	if not dances[cid] then
		dances[cid] = 1
	end
	
	local dance = dances[cid]
	
	if (dance ~= 1) then
		if not doComparePositions(positions[order[dance]], getCreaturePosition(cid)) then
			dances[cid] = 1
			return doPlayerSendCancel(cid, 'You failed, start again.')
		end
	end
	
	local pos = positions[order[dance + 1]]
	for i = 1, 10 do
		addEvent(doSendMagicEffect, i * 200, pos, CONST_ME_BIGPLANTS, cid)
	end
	dances[cid] = dance + 1
	if (dances[cid] == #order) then
		doPlayerSetStorageValue(cid, quest_storage, 10)
		doCreatureSay(cid, "Krunus should be pleased.", TALKTYPE_ORANGE_1)
	end
	return true
end 