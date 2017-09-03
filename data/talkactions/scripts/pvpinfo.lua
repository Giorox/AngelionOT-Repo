local config = {
	killsToBan = getConfigInfo('killsToBan'),
	freePremium = getConfigInfo('freePremium'),
	killsToRedSkull = getConfigInfo('killsToRedSkull'),
	pzLocked = getConfigInfo('pzLocked'),
	deathLosePercent = getConfigInfo('deathLosePercent'),
	timeToDecreaseFrags = getConfigInfo('timeToDecreaseFrags'),
	whiteSkullTime = getConfigInfo('whiteSkullTime'),
	protectionLevel = getConfigInfo('protectionLevel')
}

function onSay(cid, words, param)
	local str = "#The PvP System#\n\nProtection Zone Locked: " .. config.pzLocked .. " (1000 = 1 segundo)\nProtection Level: " .. config.protectionLevel .. "\nWhite Skull Time: " .. config.whiteSkullTime .. " (60.000 = 1 minutos)\nKills To Red Skull: " .. config.killsToRedSkull .. "\nTime To Decrease Frags: " .. config.timeToDecreaseFrags .. " (600.000 = 10 minutos)\nKills To Ban: " .. config.killsToBan .. "\nFree Premium: " .. config.freePremium
	doPlayerPopupFYI(cid, str)
	return FALSE
end