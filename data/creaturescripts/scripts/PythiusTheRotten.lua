function onDeath(cid, corpse, deathList)
	
if getCreatureName(cid):lower() == "pythius the rotten" then
		
for i = 1, #deathList do
			
if isPlayer(deathList[i]) then
				
doCreatureSay(deathList[i], "NICE FIGHTING LITTLE WORM, YOUR VICTORY SHALL BE REWARDED!", TALKTYPE_ORANGE_1, nil, nil, {x=32577, y=31402, z=15})
				
doSendMagicEffect(getCreaturePosition(deathList[i]), CONST_ME_TELEPORT)
				
doTeleportThing(deathList[i], {x=32577, y=31402, z=15})
				
doSendMagicEffect({x=32577, y=31402, z=15}, CONST_ME_TELEPORT)
				
break
			
end
		
end
	
end
	
return true

end