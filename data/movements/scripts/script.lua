function onStepIn(cid, item, position, fromPosition)
	local newnPosition = {x=32315, y=32247, z=9} 
	local tilepos1 = {x=33114, y=31703, z=12}
	local tilepos2 = {x=33116, y=31703, z=12}
	local tilepos5 = {x=33115, y=31702, z=12}
	local tilepos3 = {x=33114, y=31700, z=12}
	local tilepos4 = {x=33115, y=31700, z=12}
	local tilepos6 = {x=33116, y=31700, z=12}
	local tilepos7 = {x=33114, y=31701, z=12}
	local tilepos8 = {x=33115, y=31701, z=12}
	local tilepos9 = {x=33116, y=31701, z=12}

	doTeleportThing(cid, newnPosition)
		doSendMagicEffect(position, CONST_ME_TELEPORT)
		doSendMagicEffect(pos, CONST_ME_TELEPORT)
		doSendMagicEffect(tilepos5,15)
		doSendMagicEffect(tilepos1,5)
		doSendMagicEffect(tilepos2,5)
		doSendMagicEffect(tilepos3,5)
		doSendMagicEffect(tilepos4,5)
		doSendMagicEffect(tilepos6,5)
		doSendMagicEffect(tilepos7,5)
		doSendMagicEffect(tilepos8,5)
		doSendMagicEffect(tilepos9,5)
		setPlayerStorageValue(cid, 1883, 1)
		doCreatureSay(cid, 'You succesfully destroyed the Shadow Nexus', 19, false, cid)
	end