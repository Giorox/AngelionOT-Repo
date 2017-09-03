local config = {
	bosses={---aid of portal, position where it sends, value it sets, text it shows
		[3000] = {pos={x=33163, y=31708, z=14, stackpos=1}, value=1, text="Entering Inquisition Portals Room"},
		[1001] = {pos={x=33069, y=31783, z=13, stackpos=1}, value=2, text="Entering The Crystal Caves"},
		[1002] = {pos={x=33371, y=31613, z=14, stackpos=1}, value=3, text="Entering The Blood Halls"},
		[1003] = {pos={x=33153, y=31781, z=12, stackpos=1}, value=4, text="Entering The Vats"},
		[1004] = {pos={x=33038, y=31753, z=15, stackpos=1}, value=5, text="Entering The Arcanum"},
		[1005] = {pos={x=33199, y=31686, z=12, stackpos=1}, value=6, text="Entering The Hive"},
		[1006] = {pos={x=33111, y=31682, z=12, stackpos=1}, value=7, text="Entering The Shadow Nexus"}
		},
	mainroom={---aid, position, lowest value that can use this portal, text
		[2001] = {pos={x=33069, y=31783, z=13, stackpos=1}, value=1, text="Entering The Crystal Caves"},
		[2002] = {pos={x=33371, y=31613, z=14, stackpos=1}, value=2, text="Entering The Blood Halls"},
		[2003] = {pos={x=33153, y=31781, z=12, stackpos=1}, value=3, text="Entering The Vats"},
		[2004] = {pos={x=33038, y=31753, z=15, stackpos=1}, value=4, text="Entering The Arcanum"},
		[2005] = {pos={x=33199, y=31686, z=12, stackpos=1}, value=5, text="Entering The Hive"} },
	portals={---aid, position, text
		[3001] = {pos={x=33158, y=31728, z=11}, text="Entering The Ward of Ushuriel"},
		[3002] = {pos={x=33169, y=31755, z=13}, text="Entering The Undersea Kingdom"},
		[3003] = {pos={x=33124, y=31692, z=11}, text="Entering The Ward of Zugurosh"},
		[3004] = {pos={x=33356, y=31590, z=11}, text="Entering The Foundry"},
		[3005] = {pos={x=33197, y=31767, z=11}, text="Entering The Ward of Madareth"},
		[3006] = {pos={x=33250, y=31632, z=13}, text="Entering The Battlefield"},
		[3007] = {pos={x=33232, y=31733, z=11}, text="Entering The Ward of The Demon Twins"},
		[3008] = {pos={x=33094, y=31575, z=11}, text="Entering The Soul Wells"},
		[3009] = {pos={x=33197, y=31703, z=11}, text="Entering The Ward of Annihilon"},
		[3010] = {pos={x=33105, y=31734, z=11}, text="Entering The Ward of Hellgorak"} },
	storage=56123,---storage used in boss and mainroom portals
	e={} }----dunno whats this but have to be like this to make doCreatureSayWithDelay working, DON'T TOUCH}
function onStepIn(cid, item, position, fromPosition)
	if isPlayer(cid) == TRUE then
		if(config.bosses[item.actionid]) then
			local t= config.bosses[item.actionid]
			if getPlayerStorageValue(cid, config.storage)< t.value then
				setPlayerStorageValue(cid, config.storage, t.value)
			end
			doTeleportThing(cid, t.pos)
			doSendMagicEffect(getCreaturePosition(cid),10)
			doCreatureSay(cid,t.text,TALKTYPE_ORANGE_1)
		elseif(config.mainroom[item.actionid]) then
			local t= config.mainroom[item.actionid]
			if getPlayerStorageValue(cid, config.storage)>=t.value then
				doTeleportThing(cid, t.pos)
				doSendMagicEffect(getCreaturePosition(cid),10)
				doCreatureSay(cid,t.text,TALKTYPE_ORANGE_1)
			else
				doTeleportThing(cid, fromPosition)
				doSendMagicEffect(getCreaturePosition(cid),10)
				doCreatureSay(cid, 'You don\'t have enough energy to enter this portal', TALKTYPE_ORANGE_1)
			end
		elseif(config.portals[item.actionid]) then
			local t= config.portals[item.actionid]
			doTeleportThing(cid, t.pos)
			doSendMagicEffect(getCreaturePosition(cid),10)
			doCreatureSay(cid,t.text,TALKTYPE_ORANGE_1)
		end
	end
end
