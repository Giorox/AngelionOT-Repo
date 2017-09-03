function onStepIn(cid, item, pos)

local hss = {x=32748, y=32537, z=10}
local has = {x=32839, y=32533, z=9}

    if item.actionid == 12770 then
		doTeleportThing(cid,hss)
        doSendMagicEffect(getCreaturePosition(cid),20)
		doSendMagicEffect(has,20)
        end
    return 1
end