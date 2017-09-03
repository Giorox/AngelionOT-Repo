local t, player = {
	
pedestals = {
		
{x=33080, y=31014, z=2},
		
{x=33081, y=31014, z=2}
	},
	
newPos = {
		
{x=33059, y=31032, z=3},
		
{x=33057, y=31034, z=3}
	},
	
area = {
		
fromX = 33054, toX = 33073,
		
fromY = 31026, toY = 32356,
		
z = 3
	},
	
storageDone = 4767,
	
level = 80
}, 
{0, 0}



function getCreaturesInRange(position, radiusx, radiusy, showMonsters, showPlayers, showSummons)
	
local creaturesList = {}
	
for x = -radiusx, radiusx do
		
for y = -radiusy, radiusy do
			
if not (x == 0 and y == 0) then
				
creature = getTopCreature({x = position.x+x, y = position.y+y, z = position.z, stackpos = 253})
	
if (creature.type == 1 and showPlayers == TRUE) or (creature.type == 2 and showMonsters == TRUE and (showSummons == FALSE or (showSummons == TRUE and getCreatureMaster(creature.uid) == (creature.uid)))) then

table.insert(creaturesList, creature.uid)
				
end
			
end
		
end
	
end

	
local creature = getTopCreature(position)
	
if (creature.type == 1 and showPlayers == TRUE) or (creature.type == 2 and showMonsters == TRUE and (showSummons == FALSE or (showSummons == TRUE and getCreatureMaster(creature.uid) == (creature.uid)))) then
		
if not(table.find(creaturesList, creature.uid)) then
			
table.insert(creaturesList, creature.uid)
		
end
	
end
    
return creaturesList
end

function Wave1()
       
doSendMagicEffect(getCreaturePosition(doCreateMonster('Baron Brute', {x = 33064, y = 31033, z = 3})), CONST_ME_TELEPORT)
	
doSendMagicEffect(getCreaturePosition(doCreateMonster('The Axeorcist', {x = 33065, y = 31034, z = 3})), CONST_ME_TELEPORT)
	
addEvent(Wave2, 30 * 1000)
end

function Wave2()
       
doSendMagicEffect(getCreaturePosition(doCreateMonster('Menace', {x = 33064, y = 31033, z = 3})), CONST_ME_TELEPORT)
	
doSendMagicEffect(getCreaturePosition(doCreateMonster('Fatality', {x = 33065, y = 31034, z = 3})), CONST_ME_TELEPORT) 
	
addEvent(Wave3, 35 * 1000)
end

function Wave3()
       
doSendMagicEffect(getCreaturePosition(doCreateMonster('Incineron', {x = 33064, y = 31033, z = 3})), CONST_ME_TELEPORT)
	
doSendMagicEffect(getCreaturePosition(doCreateMonster('Coldheart', {x = 33065, y = 31034, z = 3})), CONST_ME_TELEPORT)
	
addEvent(Wave4, 40 * 1000)
end

function Wave4()
       
doSendMagicEffect(getCreaturePosition(doCreateMonster('Dreadwing', {x = 33064, y = 31033, z = 3})), CONST_ME_TELEPORT)
	
doSendMagicEffect(getCreaturePosition(doCreateMonster('Doomhowl', {x = 33065, y = 31034, z = 3})), CONST_ME_TELEPORT)
	
addEvent(Wave5, 40 * 1000)
end

function Wave5()
       
doSendMagicEffect(getCreaturePosition(doCreateMonster('Haunter', {x = 33064, y = 31033, z = 3})), CONST_ME_TELEPORT)
	
addEvent(Wave6, 40 * 1000)
end

function Wave6()
       
doSendMagicEffect(getCreaturePosition(doCreateMonster('The Dreadorian', {x = 33064, y = 31033, z = 3})), CONST_ME_TELEPORT)
	
doSendMagicEffect(getCreaturePosition(doCreateMonster('Rocko', {x = 33065, y = 31034, z = 3})), CONST_ME_TELEPORT)
       
doSendMagicEffect(getCreaturePosition(doCreateMonster('Tremorak', {x = 33064, y = 31032, z = 3})), CONST_ME_TELEPORT)
	
addEvent(Wave7, 40 * 1000)
end

function Wave7()
	
doSendMagicEffect(getCreaturePosition(doCreateMonster('Tirecz', {x = 33065, y = 31034, z = 3})), CONST_ME_TELEPORT)

end



function onUse(cid, item, fromPosition, itemEx, toPosition)
	
local failed = false
	
for i = 1, #t.pedestals do
		
player[i] = getTopCreature(t.pedestals[i]).uid
		
if(not(player[i] > 0 and isPlayer(player[i]) == TRUE and getPlayerStorageValue(player[i], t.storageDone) < 1 and getPlayerLevel(player[i]) >= t.level)) then
			
failed = true
			
break
		
end
	
end
	
if not failed then
		
if #getCreaturesInRange({x=33063, y=31035,z=3}, 10, 9, FALSE, TRUE) > 0 then
			
doPlayerSendTextMessage(cid,25, "Some people are already in the arena.")
			
return true
		
end
		
for i = 1, #player do
			
doTeleportThing(player[i], t.newPos[i])
		
end
		
Wave1()
		
doTransformItem(item.uid, 1946)
	
else
		
doPlayerSendDefaultCancel(cid, RETURNVALUE_CANNOTUSETHISOBJECT)
	
end
	
return true

end