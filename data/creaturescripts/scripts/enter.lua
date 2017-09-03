  local str1 = " has just logged in."
local str2 = "Staff Position: "
local groups = {
    [2] = "Tutor",
    [3] = "Senior Tutor",
    [4] = "Gamemaster",
    [5] = "Community Manager",
    [6] = "Administrator"
}

function onLogin(cid)
    local name = getCreatureName(cid)
    for i, group in pairs(groups) do
        if(getPlayerGroupId(cid) == i) and (isPlayerGhost(cid) == false) then
            doBroadcastMessage(name .. str1, MESSAGE_STATUS_CONSOLE_RED)
            doBroadcastMessage(str2 .. group, MESSAGE_STATUS_CONSOLE_RED)
        end
        break
    end
    return true
end 