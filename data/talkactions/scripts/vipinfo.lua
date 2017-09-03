local config = {
	rateSpawn = getConfigInfo('rateSpawn'),
	rateSkill = getConfigInfo('rateSkill'),
	rateLoot = getConfigInfo('rateLoot'),
	rateMagic = getConfigInfo('rateMagic'),
	rateSpawn = getConfigInfo('rateSpawn'),
	autoSaveEachMinutes = getConfigInfo('autoSaveEachMinutes')
}

function onSay(cid, words, param)
	local str = "#The Vip System#\n\n[Virando Vip]\nSe Voce Tiver 1kk Fale !vip.\n\n\n---------------------------------------------------------------------------\nRate Spawn: " .. config.rateSpawn
	doPlayerPopupFYI(cid, str)
	return FALSE
end