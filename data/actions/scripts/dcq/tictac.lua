function onUse(cid, item, frompos, item2, topos)


local tictacpos = { x=32838, y=32264, z=14, stackpos=0}

local tictac1 = getThingfromPos(tictacpos)

if item.itemid == 1945 then

doCreateItem(6556,1,tictacpos)

doCreateItem(6557,1,tictacpos)
	
doSendMagicEffect(tictacpos,12)
				
doTransformItem(item.uid,item.itemid+1)
					
elseif item.itemid ==1946 then
					
doTransformItem(item.uid,item.itemid-1)
                        
end
						
return true
							
end 
