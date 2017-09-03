function onThink(interval, lastExecution)
    local hours = math.ceil(getWorldUpTime() / 3600) - 1
    local minutes = math.ceil((getWorldUpTime() - (3600 * hours)) / 60)
    if minutes == 60 then
        minutes, hours = 0, hours + 1
    end
    local c = getWorldCreatures(0)
    players = (c < 1 and "Nobody" or getWorldCreatures(0) .. " player") .. (c <= 1 and "" or "s") .. " online."
    doBroadcastMessage("[ServerInfo] " .. hours .. " hour" .. (hours == 1 and "" or "s") .. " and " .. minutes .. " minute" .. (minutes == 1 and "" or "s") .. " online, " .. players, 18)
    return true
end
