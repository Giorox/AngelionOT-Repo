local config = {
	storage = 9432,
	version = 1, -- Increase this value after adding new marks, so player can step again and receive new map marks
	marks = {
		{mark = 5, pos = {x = 32369, y = 32241, z = 7}, desc = "Temple of Thais"},
		{mark = 7, pos = {x = 32376, y = 32200, z = 7}, desc = "NPC with tools!"},
		{mark = 13, pos = {x = 32343, y = 32229, z = 7}, desc = "Bank"},
		{mark = 10, pos = {x = 32346, y = 32224, z = 7}, desc = "Depot"},
		{mark = 8, pos = {x = 32362, y = 32198, z = 7}, desc = "Equipment Store"},
		{mark = 15, pos = {x = 32342, y = 32282, z = 7}, desc = "South Gate"},
		{mark = 17, pos = {x = 32283, y = 32265, z = 7}, desc = "West Gate"},
		{mark = 16, pos = {x = 32431, y = 32225, z = 7}, desc = "East Gate"},
		{mark = 14, pos = {x = 32368, y = 32178, z = 7}, desc = "North Gate"},
	}
}

local f_addMark = doPlayerAddMapMark
if(not f_addMark) then f_addMark = doAddMapMark end

function onStepIn(cid, item, position, fromPosition)
	if(isPlayer(cid) ~= TRUE or getPlayerStorageValue(cid, config.storage) == config.version) then
		return
	end

	for _, m  in pairs(config.marks) do
		f_addMark(cid, m.pos, m.mark, m.desc ~= nil and m.desc or "")
	end
	setPlayerStorageValue(cid, config.storage, config.version)
	return TRUE
end
