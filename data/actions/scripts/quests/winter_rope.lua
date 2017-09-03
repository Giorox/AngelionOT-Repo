function onUse(cid, item, frompos, item2, topos)

pos = {x=30077, y=63, z=11, stackpos=253}
ppos = getPlayerPosition (cid)

if item.uid == 12568 and item.itemid == 1945 then
doTeleportThing(cid,pos)
doSendMagicEffect(pos,10)
doTransformItem(item.uid,item.itemid+1)

elseif item.uid == 12568 and item.itemid == 1946 then
doTeleportThing(cid,pos)
doSendMagicEffect(pos,10)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
end
return 1
end