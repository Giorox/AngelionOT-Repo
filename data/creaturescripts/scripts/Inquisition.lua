local config = {
        timeToRemove = 120, -- seconds
		message = "You now have 2 minutes to exit this room through the teleporter. It will bring you to the next room only during his time or the teleporter will disappear",
        teleportId = 9773,
        bosses = { -- Monster Name,  Teleport Position
                ["Ushuriel"] = {  pos={ x=33157, y=31725, z=11, stackpos=1 }, aid=1001 },
				["Zugurosh"] = {  pos={ x=33123, y=31689, z=11, stackpos=1 }, aid=1002},
				["Madareth"] = {  pos={ x=33194, y=31768, z=11, stackpos=1 }, aid=1003},
                ["Annihilon"] = {  pos={ x=33200, y=31704, z=11, stackpos=1 }, aid=1005},
                ["Hellgorak"] = {  pos={ x=33107, y=31735, z=11, stackpos=1 }, aid=1006}
				},
		brothers ={
        ["Golgordan"] = {pos={ x=33235, y=31734, z=11, stackpos=1 },aid=1004, brother = "Latrivan"},
        ["Latrivan"] = {pos={ x=33235, y=31734, z=11, stackpos=1 },aid=1004, brother = "Golgordan"},
        brothersArea ={
                fromPos = {x = 33224, y = 31722, z = 11},
                toPos = {x = 33240, y = 31734, z = 11} } }
}
local function removal(position)
	doRemoveThing(getTileItemById(position, config.teleportId).uid, 1)
    return TRUE
end
 
function onKill(cid, target, lastHit)
    if(config.bosses[getCreatureName(target)]) then
		local t = config.bosses[getCreatureName(target)]
	    local teleport = doCreateItem(config.teleportId, t.pos)
		local position = t.pos
		doItemSetAttribute(teleport, "aid", t.aid)
        doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
		addEvent(removal, config.timeToRemove * 1000, position)
	elseif(config.brothers[getCreatureName(target)]) then
		local t = config.brothers[getCreatureName(target)]
        local brother = getCreatureByName(t.brother)
		if(isMonster(brother) == true) then
            if(isInRange(getCreaturePosition(brother), config.brothers.brothersArea.fromPos, config.brothers.brothersArea.toPos) == true) then
                return TRUE
			end
        else
			local teleport = doCreateItem(config.teleportId, t.pos)
			local position = t.pos
			doItemSetAttribute(teleport, "aid", t.aid)
			doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
			addEvent(removal, config.timeToRemove * 1000, position)
		end
	end
	return TRUE
end