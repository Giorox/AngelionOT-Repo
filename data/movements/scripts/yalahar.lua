function onStepIn(cid, item, pos)

local thais = {x=32889, y=31044, z=9}
local kurwa = {x=32894, y=31046, z=9}
local kuzwa = {x=32861, y=31061, z=9}
local kita = {x=32856, y=31055, z=9}

    if item.actionid == 1393 then
		doTeleportThing(cid,thais)
		doSendMagicEffect(getCreaturePosition(cid),47)
		else
	if item.actionid == 1394 then
		doTeleportThing(cid,kurwa)
		doSendMagicEffect(getCreaturePosition(cid),47)
		else
	if item.actionid == 1392 then
		doTeleportThing(cid,kuzwa)
		doSendMagicEffect(getCreaturePosition(cid),47)
		else
	if item.actionid == 1391 then
		doTeleportThing(cid,kita)
		doSendMagicEffect(getCreaturePosition(cid),47)
        end
    return 1
end 
end
end
end