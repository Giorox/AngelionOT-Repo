function onStepIn(cid, item, pos)
local zabierz = 200
local zycie = getCreatureHealth(cid)
if getPlayerStorageValue(cid,6464) == -1 then
if getPlayerItemCount(cid,2684) > 0 then

doPlayerRemoveItem(cid,2684, 1)
doTeleportThing(cid,{x=pos.x, y=pos.y-4, z=pos.z})
doSendMagicEffect(pos, 2)
doSendMagicEffect({x=pos.x-1, y=pos.y-1, z=pos.z}, 2)
doSendMagicEffect({x=pos.x-1, y=pos.y-2, z=pos.z}, 2)
doSendMagicEffect({x=pos.x, y=pos.y-3, z=pos.z}, 2)
doSendMagicEffect({x=pos.x, y=pos.y-4, z=pos.z}, 2)
else
doCreateItem(1493, 1, {x=pos.x, y=pos.y, z=pos.z})
doCreatureAddHealth(cid, -zabierz)
doTeleportThing(cid,{x=pos.x, y=pos.y+3, z=pos.z})
doSendMagicEffect({x=pos.x-4, y=pos.y-1, z=pos.z}, 6)
doSendMagicEffect({x=pos.x-5, y=pos.y-1, z=pos.z}, 6)
doSendMagicEffect({x=pos.x-4, y=pos.y-2, z=pos.z}, 6)
doSendMagicEffect({x=pos.x-4, y=pos.y, z=pos.z}, 6)
doSendMagicEffect({x=pos.x-3, y=pos.y-1, z=pos.z}, 6)
doSendMagicEffect({x=pos.x-2, y=pos.y-1, z=pos.z}, 6)
doSendMagicEffect({x=pos.x-1, y=pos.y-1, z=pos.z}, 6)
doSendMagicEffect({x=pos.x, y=pos.y-1, z=pos.z}, 6)
doSendMagicEffect({x=pos.x, y=pos.y, z=pos.z}, 6)
doSendMagicEffect({x=pos.x-1, y=pos.y-2, z=pos.z}, 6)
doSendMagicEffect({x=pos.x, y=pos.y-2, z=pos.z}, 6)
doSendMagicEffect({x=pos.x-2, y=pos.y-2, z=pos.z}, 6)
doSendMagicEffect({x=pos.x-3, y=pos.y-2, z=pos.z}, 6)
end
end
return 1
end