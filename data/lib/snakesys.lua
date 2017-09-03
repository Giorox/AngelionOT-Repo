SNAKE = {_VERSION="1.0 by mock",
---Snake config
itemid=1739,
freeglobalstorage=28103,
itemFood=6394,
controlpos={x=1053,y=1014,z=6},
exitpos = {x=1060,y=1013,z=7},
centerpos={x=1052,y=1013,z=7},
timer = function(cid,n,pos_,time)
local pos_ = pos_ or {{SNAKE.centerpos}}
setGlobalStorageValue(SNAKE.freeglobalstorage,cid)
if not isPlayer(cid) then
SNAKE.clean()
return
end
for i,pos in pairs(pos_) do
SNAKE.find_and_delete(pos[1])
if i == 1 then
pos[2] = SNAKE.copypos(pos[1])
pos[1] = getPosByDir({x=pos[1].x,y=pos[1].y,z=pos[1].z,stackpos=255},getCreatureLookDir(cid))
else
pos[2] = SNAKE.copypos(pos[1])
pos[1] = pos_[i-1][2]
end
local ret,p,walk = SNAKE.check(pos[1])
if ret == 1 or ret == 3 then
addEvent(doTeleportThing,1000,cid,SNAKE.exitpos)
addEvent(doCreatureSay,1100,cid,'Points '..(#pos_-1)..'.')
SNAKE.clean()
setGlobalStorageValue(SNAKE.freeglobalstorage,0)
return
end
if ret == 2 then
doRemoveItem(p.uid,-1)
if p.itemid == SNAKE.itemFood then
pos_[#pos_+1] = {pos[2],pos[2]}
for i=1,5 do
addEvent(doSendMagicEffect,100*i,pos[1],29)
end
SNAKE.generateFood()
end
end
doCreateItem(SNAKE.itemid,1,pos[1])

end
local plpos = getCreaturePosition(cid)
local generated = {}
for i=0,3 do
generated[i] = getPosByDir({x=SNAKE.controlpos.x,y=SNAKE.controlpos.y,z=SNAKE.controlpos.z},i)
end
for i,pos in pairs(generated) do
if SNAKE.samepos(plpos,pos) then

doTeleportThing(cid,SNAKE.controlpos,false)
end
addEvent(doSendMagicEffect,100,pos,56,cid)
end
addEvent(SNAKE.timer,time,cid,n,pos_,time)
end,
copypos = function(p)
return {x=p.x,y=p.y,z=p.z,stackpos=p.stackpos}
end,
samepos = function(p1,p2)
if p1.x == p2.x and p2.y == p2.y then
return true
end
return false
end,
generateFood = function()
local pp = {x=SNAKE.centerpos.x+math.random(-6,6),y=SNAKE.centerpos.y+math.random(-4,4),z=SNAKE.centerpos.z}
for i=1,5 do
addEvent(doSendMagicEffect,100*i,pp,30)
end
doCreateItem(SNAKE.itemFood,1,pp)
end,
clean = function()
for y=-4,4 do
for x=-6,6 do
local pp = {x=SNAKE.centerpos.x+x,y=SNAKE.centerpos.y+y,z=SNAKE.centerpos.z}
for i=250,255 do
pp.stackpos = i
local p = getThingFromPos(pp)
if p.itemid ~= 0 then
doRemoveItem(p.uid,-1)
doSendMagicEffect(pp,15)
end
end
end
end
end,
check = function(pos)
for i=1,10 do
pos.stackpos = i
local p = getThingFromPos(pos)
if p.itemid == SNAKE.itemid then
return 1,p,true
elseif not SNAKE.isWalkable(pos) then
return 3,p,false
elseif p.itemid ~= 0 then
return 2,p
end
end
return false
end,
find_and_delete = function(pos)
for i=0,255 do
pos.stackpos = 255-i
local p = getThingFromPos(pos)
if p.itemid == SNAKE.itemid then
return doRemoveItem(p.uid,1)
end
end
end,
isWalkable = function(pos, creature, proj, pz)-- by Nord
if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
if getTopCreature(pos).uid > 0 and creature then return false end
if getTileInfo(pos).protection and pz then return false, true end
local n = not proj and 3 or 2
for i = 0, 255 do
pos.stackpos = i
local tile = getTileThingByPos(pos)
if tile.itemid ~= 0 and not isCreature(tile.uid) then
if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
return false
end
end
end
return true
end,
} 