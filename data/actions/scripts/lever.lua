local config = {
	
player = {}, 
item = {}, 
items = {8304, 8305, 8300, 8306},
	
stand = {
		
{x = 33268, y = 31833, z = 11},
		
{x = 33268, y = 31838, z = 11},
		
{x = 33270, y = 31835, z = 11},
		
{x = 33266, y = 31835, z = 11}
	},
	
itemsPos = {
		
{x = 33268, y = 31833, z = 11},
		
{x = 33268, y = 31838, z = 11},
		
{x = 33270, y = 31835, z = 11},
		
{x = 33266, y = 31835, z = 11}
	},
	
new = {
		
{x = 33263, y = 31831, z = 12},
		
{x = 33272, y = 31831, z = 12},
		
{x = 33263, y = 31840, z = 12},
		
{x = 33272, y = 31840, z = 12}
	},
	
monster = {"Lord of the elements", 
{x = 33267, y = 31835, z = 12}}
}



function onUse(cid, item, fromPosition, itemEx, toPosition)
	
if (item.itemid == 1946) then
		
return doTransformItem(item.uid, item.itemid - 1)
	
end

	
for i = 1, 4 do
		
config.player[i] = getTopCreature(config.stand[i]).uid
	
end

	
if (isPlayer(config.player[1]) and isPlayer(config.player[2]) and isPlayer(config.player[3]) and isPlayer(config.player[4])) then
		
if (isSorcerer(config.player[1]) and isDruid(config.player[2]) and isPaladin(config.player[3]) and isKnight(config.player[4])) then
for i = 1, 4 do
				
config.item[i] = getTileItemById(config.itemsPos[i], config.items[i]).uid
			
end

			
if (#config.item == 4 and config.item[1] > 0 and config.item[2] > 0 and config.item[3] > 0 and config.item[4] > 0) then
				
for i = 1, 4 do
					
doSendMagicEffect(config.stand[i], CONST_ME_POFF)
					
doTeleportThing(config.player[i], config.new[i])
					
doSendMagicEffect(config.new[i], CONST_ME_TELEPORT)
					
doRemoveItem(config.item[i])
				
end
				
doSummonCreature(config.monster[1], config.monster[2])
				
doTransformItem(item.uid, item.itemid + 1)
			
else
				
doCreatureSay(cid, "You need one player of each vocation having completed the Elemental Spheres quest and also carrying the elemental rare item.!", TALKTYPE_ORANGE_1, nil, nil, {x=33268, y=31835, z=10})
			
end
		
else
				
doCreatureSay(cid, "You need one player of each vocation having completed the Elemental Spheres quest and also carrying the elemental rare item.!", TALKTYPE_ORANGE_1, nil, nil, {x=33268, y=31835, z=10})
		
end
	
else
				
doCreatureSay(cid, "You need one player of each vocation having completed the Elemental Spheres quest and also carrying the elemental rare item.!", TALKTYPE_ORANGE_1, nil, nil, {x=33268, y=31835, z=10})
	
end

	
return true

end