local boss = "Man In The Cave"
local pos = {x=32133,y=31147,z=2}
local newpos = {x=32131,y=31148,z=2}

local function checkArea(pos, monster)
	local spectators = getSpectators(pos, 4, 4) -- 2 tile left, 2 right, 2 up, 2 down
	if spectators ~= NULL then
        for _, pid in pairs(spectators) do
            if isMonster(pid) and getCreatureName(pid):lower() == monster:lower() then
                return true
            end
        end
	end
	return false
end

function onStepIn(cid, item, pos)

if item.uniqueid == 6708 and checkArea(pos,boss) == TRUE then
	doTeleportThing(player.uid, newpos, FALSE)
end

end