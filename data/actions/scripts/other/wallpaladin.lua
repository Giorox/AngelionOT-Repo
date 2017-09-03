function onUse(cid, item, frompos, item2, topos)
local gatepos = {x=32835, y=32333, z=11, stackpos=1}
local getgate = getThingfromPos(gatepos)

if item.uid == 30003 and item.itemid == 1945 and getgate.itemid == 6289 then
doRemoveItem(getgate.uid,1)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 30003 and item.itemid == 1946 and getgate.itemid == 0 then
doCreateItem(6289,1,gatepos)
doTransformItem(item.uid,item.itemid-1)
end
  return 1
  end