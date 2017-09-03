local config = {
	rateExp = getConfigInfo('rateExp'),
	rateSkill = getConfigInfo('rateSkill'),
	rateLoot = getConfigInfo('rateLoot'),
	rateMagic = getConfigInfo('rateMagic'),
	rateSpawn = getConfigInfo('rateSpawn'),
	protectionLevel = getConfigInfo('protectionLevel')
}

function onSay(cid, words, param)
	local str = "#Novas Spells#\n\n[Para Todos]\n Utani Mega Hur (LvL 130, Mana 100)\n\n[Para Sorcerers]\n Exevo Gran Mas Mort (LvL 130, Mana 1000)\n Exevo Gran Mas Death (LvL 200, Mana 1200)\n\n[Para Druids]\n Exevo Frozen Hur (LvL 130, Mana 1000)\n Exevo Gran Mas Ice (LvL 200, Mana 1200)\n\n[Para Paladins]\n Exevo Mas Holy (LvL 130, Mana 700)\n Exevo Mas Assassin (Lvl 200, Mana 900)\n\n[Para Knights]\n Exori Mas Gran (LvL 130, Mana 300)\n Exori Mega Gran (Lvl 200, Mana 340)\n\n\n#Novas Runas#\n\n --------------------------------------------------------------------\n-Protection level: " .. config.protectionLevel
	doPlayerPopupFYI(cid, str)
	return FALSE
end