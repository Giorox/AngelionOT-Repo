function onUse(cid, item)

local pos1 = {x=33360, y=32044, z=6, stackpos=253}
local newpos1 = {x=33441, y=32058, z=8}
local thing = getThingFromPos

if isPlayer(thing (pos1).uid) then
	doTeleportThing(thing(pos1).uid, newpos1)
	doCreatureSay(cid, "You feel the heat around you...", TALKTYPE_ORANGE_1)
	doSendMagicEffect(getCreaturePosition(cid), 15)
end

return doPlayerSendCancel(cid, "Stand on the tile..")

end