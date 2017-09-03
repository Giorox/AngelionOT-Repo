function getCreaturesInRange(position, radiusx, radiusy, showMonsters, showPlayers, showSummons)
	local creaturesList = {}
	for x = -radiusx, radiusx do
		for y = -radiusy, radiusy do
			if not (x == 0 and y == 0) then
				local creature = getTopCreature({x = position.x+x, y = position.y+y, z = position.z})
				if (creature.type == 1 and showPlayers) or (creature.type == 2 and showMonsters and (not showSummons or (showSummons and getCreatureMaster(creature.uid) == (creature.uid)))) then
					table.insert(creaturesList, creature.uid)
				end
			end
		end
	end

	local creature = getTopCreature(position)
	if (creature.type == 1 and showPlayers) or (creature.type == 2 and showMonsters and (not showSummons or (showSummons and getCreatureMaster(creature.uid) == (creature.uid)))) then
		if not(table.find(creaturesList, creature.uid)) then
			table.insert(creaturesList, creature.uid)
		end
	end
    return creaturesList
end

local once = true
local tiles = {{x=32550,y=31373,z=15}, {x=32550,y=31374,z=15}, {x=32550,y=31375,z=15}, {x=32550,y=31376,z=15}, {x=32550,y=31377,z=15}, {x=32550,y=31378,z=15}, {x=32550,y=31379,z=15}, {x=32551,y=31373,z=15}, {x=32551,y=31374,z=15}, {x=32551,y=31375,z=15}, {x=32551,y=31376,z=15}, {x=32551,y=31377,z=15}, {x=32551,y=31378,z=15}, {x=32551,y=31379,z=15}}

function onStepIn(cid, item, position, fromPosition)
	if 99 < getPlayerLevel(cid) then
		if(getPlayerStorageValue(cid, 13101) < 1 and once or not once) then
			local players = getCreaturesInRange({x=32566, y=31406, z=15}, 6, 7, FALSE, TRUE)
			if #players == 0 then
				local creatures = getCreaturesInRange({x=32566, y=31406, z=15}, 6, 7, TRUE, FALSE)
				for i = 1, #creatures do
					doRemoveCreature(creatures[i])
				end
				doRemoveItem(item.uid)
				doSendMagicEffect(position, CONST_ME_TELEPORT)
				doTeleportThing(cid, {x=32560, y=31404,z=15})
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
				doCreatureSay(doSummonCreature("Pythius the Rotten", {x=32572, y=31405, z=15}), "WHO IS SNEAKING AROUND BEHIND MY TREASURE?", TALKTYPE_ORANGE_2)
				for i = 1, #tiles do
					if i > 8 and i < 15 then
						doRelocate(tiles[i], {x=tiles[i].x+1, y=i == 14 and tiles[i].y-1 or tiles[i].y, z=tiles[i].z})
					end
					doCreateItem(i == 14 and 1509 or 598, 1, tiles[i])
				end
				doCreateItem(1304, 1, {x=32551,y=31379,z=15})
				doCreateItem(9341, 1, {x=32551,y=31379,z=15})
				return TRUE
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "There is someone else in the quest room.")
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have already completed this quest.")
		end
	end
	doTeleportThing(cid, {x=32553, y=31376, z=15})
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	return TRUE
end

function onAddItem(moveitem, tileitem, pos)
	doSendMagicEffect(pos, CONST_ME_TELEPORT)
	doRelocate(pos, {x=32560, y=31404,z=15})
	doSendMagicEffect({x=32560, y=31404,z=15}, CONST_ME_TELEPORT)
	return TRUE
end