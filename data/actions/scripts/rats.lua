function onUse(cid, item, frompos, item2, topos)
gatepos = {{x=1099, y=1205, z=8}, {x=1100, y=1205, z=8}, {x=1101, y=1205, z=8}}
getgate = getThingfromPos(gatepos)

if item.uid == 4508 and item.itemid == 1945 and getgate.itemid == 5770 then
doRemoveItem(getgate.uid,1)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 4508 and item.itemid == 1946 and getgate.itemid == 0 then
doCreateItem(5770,1,gatepos)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end