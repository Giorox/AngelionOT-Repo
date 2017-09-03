function onStepIn(cid, item, position, position)

if getPlayerLevel(cid) < 2 and getPlayerGroupId(cid) == 1 then
local newposition = {x = position.x, y = position.y+1, z = position.z}
  doTeleportThing(cid, newposition)
  doSendMagicEffect(newposition, 12)
end
	return TRUE
end