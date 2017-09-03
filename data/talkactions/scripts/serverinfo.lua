local config = {
	rateExperience = getConfigInfo('rateExperience'),
	rateSkill = getConfigInfo('rateSkill'),
	rateLoot = getConfigInfo('rateLoot'),
	rateMagic = getConfigInfo('rateMagic'),
	rateSpawn = getConfigInfo('rateSpawn'),
	protectionLevel = getConfigInfo('protectionLevel'),
	stages = getBooleanFromString(getConfigInfo('experienceStages'))
}

function onSay(cid, words, param, channel)
	local exp = config.rateExperience
	if(config.stages == TRUE) then
		exp = getExperienceStage(getPlayerLevel(cid))
	end

	doPlayerPopupFYI(cid, "Server Information:\n\nExperience rate: x" .. exp .. "\nSkills rate: x" .. config.rateSkill .. "\nLoot rate: x" .. config.rateLoot .. "\nMagic rate: x" .. config.rateMagic .. "\nSpawns rate: x" .. config.rateSpawn .. "\nProtection level: " .. config.protectionLevel)
	return TRUE
end
