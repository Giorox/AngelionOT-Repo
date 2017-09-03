local teleports = {
	-- Tile UID = {storage of task, amount of monsters, monsters to spawn}
	[14001] = {monsters = {"Leviathan"}, telePos = {x = 31914, y = 31071, z = 10}, spawnPos = {x = 31905, y = 31071, z = 10}, from = {x = 31900, y = 31064, z = 10}, to = {x = 31918, y = 31081, z = 10}},
	[14002] = {monsters = {"The Noxious Spawn"}, telePos = {x = 32842, y = 32668, z = 11}, spawnPos = {x = 32842, y = 32673, z = 11}, from = {x = 32836, y = 32665, z = 11}, to = {x = 32849, y = 32677, z = 11}},
	[14003] = {monsters = {"Necropharus"}, telePos = {x = 33028, y = 32427, z = 12}, spawnPos = {x = 33028, y = 32421, z = 12}, from = {x = 33020, y = 32415, z = 12}, to = {x = 33035, y = 32430, z = 12}},
	[14004] = {monsters = {"The Horned Fox"}, telePos = {x = 32458, y = 31993, z = 9}, spawnPos = {x = 32458, y = 32004, z = 9}, from = {x = 32453, y = 31992, z = 9}, to = {x = 32464, y = 32008, z = 9}},
	[14005] = {monsters = {"Lethal Lissy", "Ron The Ripper", "Deadeye Devious", "Brutus Bloodbeard"}, telePos = {x = 31975, y = 32896, z = 0}, spawnPos = {x = 31982, y = 32896, z = 0}, from = {x = 31972, y = 32890, z = 0}, to = {x = 31988, y = 32904, z = 0}},
	[14007] = {monsters = {"The Snapper"}, telePos = {x = 32610, y = 32724, z = 8}, spawnPos = {x = 32611, y = 32727, z = 8}, from = {x = 32606, y = 32720, z = 8}, to = {x = 32620, y = 32733, z = 8}},
	[14008] = {monsters = {"Hide"}, telePos = {x = 32815, y = 32704, z = 8}, spawnPos = {x = 32816, y = 32708, z = 8}, from = {x = 32810, y = 32701, z = 8}, to = {x = 32824, y = 32713, z = 8}},
	[14012] = {monsters = {"Shardhead"}, telePos = {x = 32102, y = 31125, z = 2}, spawnPos = {x = 32101, y = 31130, z = 2}, from = {x = 32095, y = 31122, z = 2}, to = {x = 32108, y = 31136, z = 2}},
	[14019] = {monsters = {"Esmeralda"}, telePos = {x = 32759, y = 31253, z = 9}, spawnPos = {x = 32759, y = 31256, z = 9}, from = {x = 32755, y = 31250, z = 9}, to = {x = 32764, y = 31259, z = 9}},
	[14020] = {monsters = {"The Old Widow"}, telePos = {x = 32804, y = 32280, z = 8}, spawnPos = {x = 32800, y = 32280, z = 8}, from = {x = 32794, y = 32273, z = 8}, to = {x = 32807, y = 32288, z = 8}},
	[14021] = {monsters = {"The Many"}, telePos = {x = 32921, y = 32894, z = 8}, spawnPos = {x = 32921, y = 32899, z = 8}, from = {x = 32915, y = 32891, z = 8}, to = {x = 32927, y = 32904, z = 8}},
	[14506] = {monsters = {"Demodras"}, telePos = {x = 32748, y = 32287, z = 10}, spawnPos = {x = 32745, y = 32292, z = 10}, from = {x = 32738, y = 32283, z = 10}, to = {x = 32757, y = 32300, z = 10}},
	[14505] = {monsters = {"Tiquandas Revenge"}, telePos = {x = 32888, y = 32580, z = 4}, spawnPos = {x = 32883, y = 32580, z = 4}, from = {x = 32881, y = 32578, z = 4}, to = {x = 32892, y = 32588, z = 4}},
	[14022] = {monsters = {"Stonecracker"}, telePos = {x = 33259, y = 31695, z = 15}, spawnPos = {x = 33257, y = 31702, z = 15}, from = {x = 33252, y = 31691, z = 15}, to = {x = 33266, y = 31708, z = 15}},
}

local function getCreaturesInArea(fromPos, toPos, creatureType)
	local creatures = {}
	for x = fromPos.x, toPos.x do
		for y = fromPos.y, toPos.y do
			for z = fromPos.z, toPos.z do
				local creature = getTopCreature({x = x, y = y, z = z}).uid
				local cType  creatureType:lower()
				if (cType == "players" and isPlayer(creature)) then
					table.insert(creatures, creature)
				elseif (cType == "monsters" and isMonster(creature)) then
					table.insert(creatures, creature)
				elseif (cType == "npcs" and isNpc(creature)) then
					table.insert(creatures, creature)
				elseif (cType == "all") then
					table.insert(creatures, creature)
				end
			end
		end
	end
	return creatures
end

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
local now = teleports[item.uid]
	if (#getCreaturesInArea(now.from, now.to, "players") > 0) then
		doTeleportThing(cid, fromPosition, true)
		doPlayerSendCancel(cid, "Someone else is in the room.")
	end

	if getPlayerStorageValue(cid, item.uid + (item.uid < 14500 and 100 or 0)) == 1 then
		for _, monster in ipairs(getCreaturesInArea(now.from, now.to, "monsters")) do
			doRemoveCreature(monster)
		end

		setPlayerStorageValue(cid, item.uid + (item.uid < 14500 and 100 or 0), 2)
		doTeleportThing(cid, now.telePos)
		doSendMagicEffect(now.telePos, CONST_ME_TELEPORT)
		doSummonCreature(now.monsters[math.random(#now.monsters)], now.spawnPos)
		doSendMagicEffect(now.spawnPos, CONST_ME_TELEPORT)
		return true
	end

	doTeleportThing(cid, fromPosition, true)
	return true
end