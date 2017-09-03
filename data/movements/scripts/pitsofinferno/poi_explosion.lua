function onStepIn(cid, item, frompos, item2, topos) 

storage = 45114

elo1 = {x=32826, y=32274, z=12}
elo2 = {x=32826, y=32275, z=12}
elo3 = {x=32826, y=32276, z=12}
elo4 = {x=32826, y=32277, z=12}
elo5 = {x=32826, y=32278, z=12}
elo6 = {x=32826, y=32279, z=12}
if getPlayerStorageValue(cid, storage) == -1 then
         setPlayerStorageValue(cid, storage, 1)
if item.uid == 14551 then
 doSendMagicEffect(elo1,4)
 doSendMagicEffect(elo2,4)
 doSendMagicEffect(elo3,4)
 doSendMagicEffect(elo4,4)
 doSendMagicEffect(elo5,4)
 doSendMagicEffect(elo6,4)
end 
end
end
