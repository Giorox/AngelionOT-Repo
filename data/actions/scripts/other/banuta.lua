function onUse(cid, item, fromPosition, itemEx, toPosition)
    
removals = {
        { item = 3474, pos = { x = 32864 , y = 32556 , z = 11 } },
        
{ item = 3475, pos = { x = 32865 , y = 32556 , z = 11 } }    
    }
    
    
if item.itemid == 1945 then
        
for i = 1, #removals do
            
removals[i].pos.stackpos = 1
            
doRemoveItem(getThingfromPos(removals[i].pos).uid, 1)
        
end
        
doTransformItem(item.uid, item.itemid + 1)
    
elseif item.itemid == 1946 then
        
for i = 1, #removals do
            
doCreateItem(removals[i].item, 1, removals[i].pos)
        
end
        
doTransformItem(item.uid, item.itemid - 1)
    
end
    
return TRUE

end  