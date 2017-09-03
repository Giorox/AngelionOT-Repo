function onUse(cid, item, fromPosition, itemEx, toPosition)
	
if(itemEx.uid <= 65535 or itemEx.actionid > 0) and (itemEx.itemid == 354 or itemEx.itemid == 355) then

doTransformItem(itemEx.uid, 392)
		
doDecayItem(itemEx.uid)
		
return true
	
end
	
local newPosition = {x=32566, y=31338, z=10}
	
if(itemEx.uid == 53118) and (itemEx.itemid == 6299) then
		
doTeleportThing(cid, newPosition)
		
doSendMagicEffect(newPosition, CONST_ME_TELEPORT)
		
doSendMagicEffect(fromPosition, CONST_ME_POFF)
        
return true
	
end
	
if toPosition.x == 32551 and toPosition.y == 31379 and toPosition.z == 15 and 99 < getPlayerLevel(cid) then

local get1, get2 = getTileItemById({
x=32551, 
y=31379, 
z=15}, 1304).uid, getTileItemById({x=32551, y=31379, z=15}, 9341).uid
		
if get1 > 0 and get2 > 0 then
			
doRemoveItem(get1)
			
doRemoveItem(get2)
			
for x = 32550, 32551 do
				
for y = 31373, 31379 do
					
if x == 32551 and 31373 < y then
						
doSendMagicEffect({x=x, y=y, z=15}, CONST_ME_POFF)
					
end
					
doCreateItem(5815, 1, {x=x, y=y, z=15})
				
end
			
end
			
doSetItemActionId(doCreateItem(1387, 1, {x=32551, y=31376, z=15}), 60126)
			
return TRUE
		
end
	
end
	
if(itemEx.itemid == 7200) then
		
doTransformItem(itemEx.uid, 7236)
		
doSendMagicEffect(toPosition, CONST_ME_BLOCKHIT)
		
return true
	
end
	
if(itemEx.uid == 65532 and itemEx.itemid == 1304) then
		
local newPosition = {x=32566, y=31338, z=10}
		
local tilepos = {x=32808, y=32336, z=11, stackpos=0}
		
local tilepos2 = {x=32809, y=32336, z=11, stackpos=0}
		
local tilepos3 = {x=32810, y=32336, z=11, stackpos=0}
		
local tilepos4 = {x=32808, y=32334, z=11, stackpos=0}
		
local tilepos5 = {x=32807, y=32334, z=11, stackpos=0}
		
local tilepos6 = {x=32807, y=32335, z=11, stackpos=0}
		
local tilepos7 = {x=32807, y=32336, z=11, stackpos=0}
		
local tilepos8 = {x=32807, y=32337, z=11, stackpos=0}
		
local tilepos9 = {x=32806, y=32337, z=11, stackpos=0}
		
local tilepos10 = {x=32805, y=32337, z=11, stackpos=0}
		
local tilepos11 = {x=32805, y=32338, z=11, stackpos=0}
		
local tilepos12 = {x=32805, y=32339, z=11, stackpos=0}
		
local tilepos13 = {x=32806, y=32339, z=11, stackpos=0}
		
local tilepos14 = {x=32806, y=32338, z=11, stackpos=0}
		
local tilepos15 = {x=32807, y=32338, z=11, stackpos=0}
		
local tilepos16 = {x=32808, y=32338, z=11, stackpos=0}
		
local tilepos17 = {x=32808, y=32337, z=11, stackpos=0}
		
local tilepos18 = {x=32809, y=32337, z=11, stackpos=0}
		
local tilepos19 = {x=32810, y=32337, z=11, stackpos=0}
		
local tilepos20 = {x=32811, y=32337, z=11, stackpos=0}
		
local tilepos21 = {x=32811, y=32338, z=11, stackpos=0}
		
local tilepos22 = {x=32806, y=32338, z=11, stackpos=0}
		
local tilepos23 = {x=32810, y=32338, z=11, stackpos=0}
		
local tilepos24 = {x=32810, y=32339, z=11, stackpos=0}
		
local tilepos25 = {x=32809, y=32339, z=11, stackpos=0}
		
local tilepos26 = {x=32809, y=32338, z=11, stackpos=0}
		
local tilepos27 = {x=32811, y=32336, z=11, stackpos=0}
		
local tilepos28 = {x=32811, y=32335, z=11, stackpos=0}
		
local tilepos29 = {x=32810, y=32335, z=11, stackpos=0}
		
local tilepos30 = {x=32809, y=32335, z=11, stackpos=0}
		
local tilepos31 = {x=32808, y=32335, z=11, stackpos=0}
		
local tilepos32 = {x=32809, y=32334, z=11, stackpos=0}
		
local tilepos33 = {x=32809, y=32333, z=11, stackpos=0}
		
local tilepos34 = {x=32810, y=32333, z=11, stackpos=0}
		
local tilepos35 = {x=32811, y=32333, z=11, stackpos=0}
		
local tilepos36 = {x=32806, y=32338, z=11, stackpos=0}
		
local tilepos37 = {x=32810, y=32334, z=11, stackpos=0}
		
local tilepos38 = {x=32811, y=32334, z=11, stackpos=0}
		
local tilepos39 = {x=32812, y=32334, z=11, stackpos=0}
		
local tilepos40 = {x=32813, y=32334, z=11, stackpos=0}
		
local tilepos41 = {x=32814, y=32334, z=11, stackpos=0}
		
local tilepos42 = {x=32812, y=32333, z=11, stackpos=0}
		
local tilepos43 = {x=32810, y=32334, z=11, stackpos=0}
		
local tilepos45 = {x=32812, y=32335, z=11, stackpos=0}
		
local tilepos46 = {x=32813, y=32335, z=11, stackpos=0}
		
local tilepos47 = {x=32814, y=32335, z=11, stackpos=0}
		
local tilepos48 = {x=32814, y=32333, z=11, stackpos=0}
		
local tilepos49 = {x=32813, y=32333, z=11, stackpos=0}
		
		
local tile4 = getThingfromPos(tilepos4)
		
local tile = getThingfromPos(tilepos)
		
local tile2 = getThingfromPos(tilepos2)
		
local tile3 = getThingfromPos(tilepos3)
		
local tile5 = getThingfromPos(tilepos5)
		
local tile6 = getThingfromPos(tilepos6)
		
local tile7 = getThingfromPos(tilepos7)
		
local tile8 = getThingfromPos(tilepos8)
		
local tile9 = getThingfromPos(tilepos9)
		
local tile10 = getThingfromPos(tilepos10)
		
local tile11 = getThingfromPos(tilepos11)
		
local tile12 = getThingfromPos(tilepos12)
		
local tile13 = getThingfromPos(tilepos13)
		
local tile14 = getThingfromPos(tilepos14)
		
local tile15 = getThingfromPos(tilepos15)
		
local tile16 = getThingfromPos(tilepos16)
		
local tile17 = getThingfromPos(tilepos17)
		
local tile18 = getThingfromPos(tilepos18)
		
local tile19 = getThingfromPos(tilepos19)
		
local tile20 = getThingfromPos(tilepos20)
		
local tile21 = getThingfromPos(tilepos21)
		
local tile22 = getThingfromPos(tilepos22)
		
local tile23 = getThingfromPos(tilepos23)
		
local tile24 = getThingfromPos(tilepos24)
		
local tile25 = getThingfromPos(tilepos25)
		
local tile26 = getThingfromPos(tilepos26)
		
local tile27 = getThingfromPos(tilepos27)
		
local tile28 = getThingfromPos(tilepos28)
		
local tile29 = getThingfromPos(tilepos29)
		
local tile30 = getThingfromPos(tilepos30)
		
local tile31 = getThingfromPos(tilepos31)
		
local tile32 = getThingfromPos(tilepos32)
		
local tile33 = getThingfromPos(tilepos33)
		
local tile34 = getThingfromPos(tilepos34)
		
local tile35 = getThingfromPos(tilepos35)
		
local tile36 = getThingfromPos(tilepos36)
		
local tile37 = getThingfromPos(tilepos37)
		
local tile38 = getThingfromPos(tilepos38)
		
local tile39 = getThingfromPos(tilepos39)
		
local tile40 = getThingfromPos(tilepos40)
		
local tile41 = getThingfromPos(tilepos41)
		
local tile42 = getThingfromPos(tilepos42)
		
local tile43 = getThingfromPos(tilepos43)
		
local tile45 = getThingfromPos(tilepos45)
		
local tile46 = getThingfromPos(tilepos46)
		
local tile47 = getThingfromPos(tilepos47)
		
local tile48 = getThingfromPos(tilepos48)
		
local tile49 = getThingfromPos(tilepos49)

		
doSendMagicEffect(tilepos4,9)
		
doCreateItem(5815,1,tilepos5)
		
doCreateItem(5815,1,tilepos6)
		
doCreateItem(5815,1,tilepos4)
		
doCreateItem(5815,1,tilepos)
		
doCreateItem(5815,1,tilepos2)
		
doCreateItem(5815,1,tilepos3)
		
doCreateItem(5815,1,tilepos7)
		
doCreateItem(5815,1,tilepos8)
		
doCreateItem(5815,1,tilepos9)
		
doCreateItem(5815,1,tilepos10)
		
doCreateItem(5815,1,tilepos11)
		
doCreateItem(5815,1,tilepos12)
		
doCreateItem(5815,1,tilepos13)
		
doCreateItem(5815,1,tilepos14)
		
doCreateItem(5815,1,tilepos15)
		
doCreateItem(5815,1,tilepos16)
		
doCreateItem(5815,1,tilepos17)
		
doCreateItem(5815,1,tilepos18)
		
doCreateItem(5815,1,tilepos19)
		
doCreateItem(5815,1,tilepos20)
		
doCreateItem(5815,1,tilepos21)
		
doCreateItem(5815,1,tilepos22)
		
doCreateItem(5815,1,tilepos23)
		
doCreateItem(5815,1,tilepos24)
		
doCreateItem(5815,1,tilepos25)
		
doCreateItem(5815,1,tilepos26)
		
doCreateItem(5815,1,tilepos27)
		
doCreateItem(5815,1,tilepos28)
		
doCreateItem(5815,1,tilepos29)
		
doCreateItem(5815,1,tilepos30)
		
doCreateItem(5815,1,tilepos31)
		
doCreateItem(5815,1,tilepos32)
		
doCreateItem(5815,1,tilepos33)
		
doCreateItem(5815,1,tilepos34)
		
doCreateItem(5815,1,tilepos35)
		
doCreateItem(5815,1,tilepos36)
		
doCreateItem(5815,1,tilepos37)
		
doCreateItem(5815,1,tilepos38)
		
doCreateItem(5815,1,tilepos39)
		
doCreateItem(5815,1,tilepos40)
		
doCreateItem(5815,1,tilepos41)
		
doCreateItem(5815,1,tilepos42)
		
doCreateItem(5815,1,tilepos43)
		
doCreateItem(5815,1,tilepos45)
		
doCreateItem(5815,1,tilepos46)
		
doCreateItem(5815,1,tilepos47)
		
doCreateItem(5815,1,tilepos48)
		
doCreateItem(5815,1,tilepos49)
		
doTransformItem(itemEx.uid, 2256)
		
return TRUE
	
end

end