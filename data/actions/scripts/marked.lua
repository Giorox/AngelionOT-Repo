function onUse(cid, item, fromPosition, itemEx, toPosition)


local outfit1 = {lookType = 128, lookHead = 0, lookAddons = 0, lookLegs = 0, lookBody = 0, lookFeet = 0} 
local outfit2 = {lookType = 136, lookHead = 0, lookAddons = 0, lookLegs = 0, lookBody = 0, lookFeet = 0}
local storage = 42325

local areaPosition =
{
    
{x=33380, y=31055, z=8, stackpos = 255}, 
{x=33400, y=31183, z=8, stackpos = 255}, 
{x=33370, y=31093, z=8, stackpos = 255}, 
{x=33397, y=31117, z=8, stackpos = 255}, 
{x=33349, y=31165, z=8, stackpos = 255}, 
{x=33383, y=31192, z=8, stackpos = 255}, 
{x=33314, y=31058, z=8, stackpos = 255}, 
{x=33394, y=31090, z=8, stackpos = 255}, 
{x=33327, y=31055, z=9, stackpos = 255}, 
{x=33387, y=31077, z=9, stackpos = 255}  }

	
if isInRange(getCreaturePosition(cid), areaPosition[1], areaPosition[2]) or isInRange(getCreaturePosition(cid), areaPosition[3], areaPosition[4]) or isInRange(getCreaturePosition(cid), areaPosition[5], areaPosition[6]) or isInRange(getCreaturePosition(cid), areaPosition[7], areaPosition[8]) or isInRange(getCreaturePosition(cid), areaPosition[9], areaPosition[10]) then
		
if getPlayerStorageValue(cid,storage) ~= 1 then
			
doSetItemOutfit(cid, 12245, -1)
			
setPlayerStorageValue(cid, storage, 1)
			
		
elseif getPlayerStorageValue(cid,storage) == 1 then
			
if getPlayerSex(cid) == PLAYERSEX_FEMALE then
				
doCreatureChangeOutfit(cid, outfit2)
			
else
				
doCreatureChangeOutfit(cid, outfit1)
			
end	
			
setPlayerStorageValue(cid, storage, 0)
		
end	
	
end
	
return false

end