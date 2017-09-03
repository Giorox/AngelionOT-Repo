function onStepIn(cid, item, frompos, item2, topos) 

playerpos = getPlayerPosition(cid) 
novapos = {x=32842, y=32276, z=10} 

if item.uid == 10253 then

getThingfromPos(playerpos) 
doSendMagicEffect(playerpos,4) 
doTeleportThing(cid,novapos) 
end 
end