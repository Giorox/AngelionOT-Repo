function onUse(cid, item, fromPosition, itemEx, toPosition)
    
removals = { --Stones
        { x = 33295 , y = 31677 , z = 15, stackpos = 1 },
        
{ x = 33296 , y = 31677 , z = 15, stackpos = 1 },
        
{ x = 33297 , y = 31677 , z = 15, stackpos = 1 },
        
{ x = 33298 , y = 31677 , z = 15, stackpos = 1 },
		
{ x = 33299 , y = 31677 , z = 15, stackpos = 1 },
    }
    
     
if item.itemid == 1945 then
        
for i = 1, #removals do
            
doRemoveItem(getThingfromPos(removals[i]).uid, 1)
        
end
		
local LeverPos = {x=33290, y=31715, z=12}
		
doSendMagicEffect(LeverPos, CONST_ME_POFF)
		
doTransformItem(item.uid, item.itemid + 1)
	
end
  
return TRUE

end