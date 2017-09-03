local config = {
oldpos = {
{x=947,y=961,z=7}, --pos em que o player 1 tem que estar para a alavanca funcionar
{x=949,y=961,z=7} --pos em que o player 2 tem que estar para a alavanca funcionar
},
newpos = {
{x=944,y=966,z=7}, --pos para aonde o player 1 vai ser teleportado (dentro da arena)
{x=952,y=966,z=7} --pos para aonde o player 2 vai ser teleportado (dentro da arena)
}
}

function onUse(cid, item, pos)
if item.itemid == 1946 then
doTransformItem(item.uid, 1945)
else
doTransformItem(item.uid, 1946)
end
local p = {}
for i,v in ipairs(config.oldpos) do
local pid = getTopCreature(v).uid
if pid == 0 or not isPlayer(pid) then
doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
return true
end
table.insert(p, pid)
end
for i,v in ipairs(p) do
doSendMagicEffect(config.oldpos[i], CONST_ME_POFF)
doTeleportThing(v, config.newpos[i], false)
end
return true
end