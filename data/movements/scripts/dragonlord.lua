function onStepIn(cid, item, pos)
local thais = {x=32701, y=31636, z=6}
local thaiss = {x=32818, y=31599, z=9}
	food1 = {x=32816, y=31601, z=9, stackpos=1}
	getfood1 = getThingfromPos(food1)

if item.actionid == 14116 and getfood1.itemid == 2319 then
doTeleportThing(cid,thais)
        doSendMagicEffect(getCreaturePosition(cid),12)	
doRemoveItem(getfood1.uid,1)		
else
doTeleportThing(cid,thaiss)
doSendMagicEffect(getCreaturePosition(cid),10)	
end
	return TRUE
end