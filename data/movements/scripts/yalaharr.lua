function onStepIn(cid, item, pos)

local thais = {x=32784, y=31178, z=9}
local kurwa = {x=32783, y=31173, z=10}
local kuzwa = {x=32778, y=31171, z=14}

    if item.actionid == 9105 then
		doTeleportThing(cid,kurwa)
		doSendMagicEffect(getCreaturePosition(cid),17)
		else
	if item.actionid == 9106 then
		doTeleportThing(cid,thais)
		doSendMagicEffect(getCreaturePosition(cid),17)
		else
	if item.actionid == 24061 then
		doTeleportThing(cid,kuzwa)
		doSendMagicEffect(getCreaturePosition(cid),48)
        end
    return 1
end 
end
end