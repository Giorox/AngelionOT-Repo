function onStepIn(cid, item, position, fromPosition)

Scheck = getPlayerStorageValue(cid, 83234)
ItemCheck = getPlayerItemCount(cid,8266)
out =  {x=position.x, y=position.y-1, z=position.z}
Spawn =  {x=position.x, y=position.y-10, z=position.z}


starting={x=33264, y=32402, z=12, stackpos=253}
checking={x=starting.x, y=starting.y, z=starting.z, stackpos=starting.stackpos}
ending=  {x=33278, y=32417, z=12, stackpos=253}
players=0
totalmonsters=0
monster = {}
repeat
creature= getThingfromPos(checking)
if creature.itemid > 0 then
if isPlayer(creature.uid) == 1 then
players=players+1
end
if isCreature(creature.uid) then
totalmonsters=totalmonsters+1
monster[totalmonsters]=creature.uid
   end
end
checking.x=checking.x+1
if checking.x>ending.x then
checking.x=starting.x
checking.y=checking.y+1
end
until checking.y>ending.y

if players == 0 and totalmonsters == 0 and ItemCheck > 0 then
	doSummonCreature("Koshei The Deathless", Spawn)


elseif players==0 then

current=0
repeat
current=current+1
doRemoveCreature(monster[current])
until current>=totalmonsters
end


end