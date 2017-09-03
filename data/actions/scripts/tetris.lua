local config = {
uppos = {x=1002,y=954,z=7},
dowpos = {x=1008,y=965,z=7},
playerpos = {x=1010,y=962,z=7},
block_start={x=1005,y=956,z=7},
exit={x=1010,y=959,z=7},
delay=10,
item=1739,
effects = {
mark=3,
burn=15,
},
blocks = {
--
{
{
{0,1,0},
{1,1,1},
{0,0,0},
},
{
{0,1,0},
{0,1,1},
{0,1,0},
},
{
{0,0,0},
{1,1,1},
{0,1,0},
},
{
{0,1,0},
{1,1,0},
{0,1,0}
}
},

{
{
{1,1,1},
},
{
{1},
{1},
{1},
},
},
--
{
{
{1},
},
},
{
{
{1,1},{1,1},
},
},


},
data={false},
}

local function createItensInArea(item, pos, area) -- Function by mock
local centro = {}
local coisa = {}
centro.y = math.floor(#area/2)+1
for y = 1, #area do
for x = 1, #area[y] do
number = area[y][x]
if number > 0 then
centro.x = math.floor(table.getn(area[y])/2)+1
local pos = {x = pos.x + x - centro.x, y = pos.y + y - centro.y, z = pos.z}
local items = doCreateItem(item, 1, pos)
table.insert(coisa, 1, items)
end
end
end
return coisa
end
local function removeItensInArea(item, pos, area) -- Function by mock
local centro = {}
centro.y = math.floor(table.getn(area)/2)+1
for y = 1, table.getn(area) do
for x = 1, table.getn(area[y]) do
number = area[y][x]
if number > 0 then
centro.x = math.floor(table.getn(area[y])/2)+1
local pos = {x = pos.x + x - centro.x, y = pos.y + y - centro.y, z = pos.z,stackpos = 255}
local coisa = getThingfromPos(pos)
if coisa.itemid == item then
doRemoveItem(coisa.uid,1)
end
end
end
end
end
local function checkItensInArea(item, pos, area,coisas) -- Function by mock
local centro = {}
if coisas == nil then
coisas = {}
end
centro.y = math.floor(table.getn(area)/2)+1
for y = 1, table.getn(area) do
for x = 1, table.getn(area[y]) do
number = area[y][x]
if number > 0 then
centro.x = math.floor(table.getn(area[y])/2)+1
local pos = {x = pos.x + x - centro.x, y = pos.y + y - centro.y, z = pos.z,stackpos = 1}
local coisa = getThingfromPos(pos)
if coisa.itemid == item then
if not isInArray(coisas, coisa.uid) then
return true
end
end
end
end
end
return false
end
function clean(pos1,pos2,stack) -- Function by mock
for x = 0, math.floor(pos2.x-pos1.x) do
for y = 0, math.floor(pos2.y-pos1.y) do
local coisa = getThingfromPos({x = pos1.x+x, y = pos1.y+y, z = pos1.z, stackpos = stack})
if coisa.itemid == config.item then
doRemoveItem(coisa.uid,1)
end
end
end
end
local function pushdown(pos1,pos2,item) -- push all piece 1 sqm to down
-- Function by mock
local ymax = math.floor(pos2.y-pos1.y)
for y = 1,ymax do
for x = 1, math.floor(pos2.x-pos1.x)-1 do
local coisa = getThingfromPos({x = pos1.x+x, y = pos1.y+(ymax-y), z = pos1.z, stackpos = 1})
if coisa.itemid == item then
local p2 = getThingPos(coisa.uid)
doRemoveItem(coisa.uid,1)
p2.y = p2.y+1
doCreateItem(item, 1, p2)
end
end
end
end
local function checkline(pos,cid,item) -- Function by mock
local sizex = config.dowpos.x-config.uppos.x-1
local t = {}
for x=1,sizex do
local using = {x=pos.x+x,y=pos.y,z=pos.z,stackpos=1}
local igz = getThingfromPos(using)

if igz.itemid == item then

table.insert(t,1,{using,igz.uid})
end
end
if #t == sizex then
setPlayerStorageValue(cid,21451, getPlayerStorageValue(cid, 21451)+1)
for i=1,#t do
local f = t[i]
doRemoveItem(f[2],1)
if config.effects.burn then
doSendMagicEffect(f[1],config.effects.burn)
end
end
pushdown(config.uppos,{x=config.dowpos.x,y=pos.y,z =config.dowpos.z},item)
checkline(pos,cid,item)
end
end
function doSendMagicEffectInArea(pos,effect,area,cid) -- Function by mock
local centro = {}
centro.y = math.floor(table.getn(area)/2)+1
for y = 1, table.getn(area) do
for x = 1, table.getn(area[y]) do
if area[y][x] > 0 then
centro.x = math.floor(table.getn(area[y])/2)+1
if type(effect) == 'table' then
doSendMagicEffect({x=pos.x+x-centro.x,y=pos.y+y-centro.y,z= pos.z},(effect[area[y][x]] or 0),cid)
else
doSendMagicEffect({x=pos.x+x-centro.x,y=pos.y+y-centro.y,z= pos.z},effect or 0,cid)
end
end
end
end
return true
end

local function pedra(pos,cid,area) -- Function by mock
config.data = config.data or {}
config.data[6] = config.data[6] or config.delay
config.data[5] = config.data[5] or 1
config.data[5] = config.data[5]+1
if config.data[1] == false then
config.data[1] = #area == 1 and 1 or math.random(1,#area)
end
local cre_pos = getCreaturePosition(cid)
pos.stackpos = 255
pos.y = pos.y-1
if getThingfromPos(pos).itemid == config.item then
removeItensInArea(config.item,pos, area[config.data[1]])
end
if config.data[5] >= config.data[6] then
pos.y = pos.y+1
config.data[5] = 1
end
pos.stackpos = 1
if cre_pos.x == config.playerpos.x+1 then
doTeleportThing(cid, config.playerpos)
pos.x = pos.x+1
local coisa2 = getThingfromPos(pos)
if checkItensInArea(463,pos, area[config.data[1]]) or checkItensInArea(config.item,pos, area[config.data[1]]) then
pos.x = pos.x-1
doSendAnimatedText(cre_pos, "Block", math.random(1,255))
end
elseif cre_pos.x == config.playerpos.x and cre_pos.y == config.playerpos.y+1 then
doTeleportThing(cid, config.playerpos)
pos.y = pos.y+1
if checkItensInArea(463,pos, area[config.data[1]]) or checkItensInArea(config.item,pos, area[config.data[1]]) then
pos.y = pos.y-1
doSendAnimatedText(cre_pos, "Block", math.random(1,255))
end
elseif cre_pos.x == config.playerpos.x and cre_pos.y == config.playerpos.y-1 then
doTeleportThing(cid, config.playerpos)
if #area > 1 then
local rot = #area < config.data[1]+1 and 1 or config.data[1]+1
if checkItensInArea(463,pos, area[rot]) or checkItensInArea(config.item,pos, area[rot]) then
doSendAnimatedText(cre_pos, "Block", math.random(1,255))
else
config.data[1] = rot
end
end
elseif cre_pos.x == config.playerpos.x-1 then
doTeleportThing(cid, config.playerpos)
pos.x = pos.x-1
local coisa2 = getThingfromPos(pos)
if checkItensInArea(463,pos, area[config.data[1]]) or checkItensInArea(config.item,pos, area[config.data[1]]) then
pos.x = pos.x+1
doSendAnimatedText(cre_pos, "Block", math.random(1,255))
end
end
if config.data[3] then
config.data[3] = nil
return
end
pos.stackpos=1
if getThingfromPos(pos).itemid == config.item then
doPlayerSendTextMessage(config.data[2], 24, 'You lose!')
clean(config.uppos,config.dowpos,2)
clean(config.uppos,config.dowpos,1)
creation = nil
doTeleportThing(config.data[2], config.exit)
config.data[2] = nil
config.data[1] = false
config.data[3] = true
return
end
local uida = createItensInArea(config.item,pos, area[config.data[1]])
if config.effects.mark then
doSendMagicEffectInArea(pos,config.effects.mark, area [config.data[1]] )
end
local humrox = pos
pos.y = pos.y+1
if not checkItensInArea(463,pos, area[config.data[1]]) and not checkItensInArea(config.item,humrox, area[config.data[1]],uida) then
addEvent(pedra, 100, pos,cid,area)
else
e = 0
for i=0,((config.dowpos.y)-(config.uppos.y)) do
e = e-1
addEvent(checkline,100*i,{x=config.uppos.x,y= config.dowpos.y +e,z=config.uppos.z},cid,config.item)
end
creation = nil
config.data[1] = false
end
end


local function control_loop(startpos)
if not config.data[2] then
return
end
doSendMagicEffect(getCreaturePosition(config.data[2]), 1)
local poi = getPlayerStorageValue(config.data[2], 21451)
if poi == -1 then
setPlayerStorageValue(config.data[2],21451, 0)
poi = 0
end
doSendAnimatedText(getCreaturePosition(config.data[2]), "points: "..poi, math.random(1,255))
startpos.stackpos = 2
local coisaa = getThingfromPos(startpos)
if not creation then
creation = true
addEvent(pedra, 1000, {x=config.block_start.x,y=config.block_start.y,z= config.block_start.z ,stackpos=1},config.data[2],config.blocks[math.random(1,#config.blocks)])
end
if coisaa.itemid == config.item then
doPlayerSendTextMessage(config.data[2], 24, 'You lose!')
clean(config.uppos,config.dowpos,2)
clean(config.uppos,config.dowpos,1)
creation = nil
doTeleportThing(config.data[2], config.exit)
config.data[2] = nil
config.data[1] = false
config.data[3] = true
else
addEvent(control_loop, 300, startpos)
end
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
if not config.data[2] then
doTeleportThing(cid, config.playerpos)
setPlayerStorageValue(cid,21451, 0)
config.data[2] = cid
addEvent(control_loop, 1000,config.block_start)
else
doPlayerSendCancel(cid,'Tetris are in use. Please wait.')
end
return false
end