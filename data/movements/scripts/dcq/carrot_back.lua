function onStepIn(cid, item, pos)

local back = {x=32861, y=32240, z=9}

if item.actionid == 61004 then
		doTeleportThing(cid,back)
		doSendMagicEffect({x=pos.x, y=pos.y, z=pos.z}, 2)
		doSendMagicEffect({x=pos.x-1, y=pos.y+1, z=pos.z}, 2)
		doSendMagicEffect({x=pos.x-1, y=pos.y+2, z=pos.z}, 2)
		doSendMagicEffect({x=pos.x, y=pos.y+3, z=pos.z}, 2)
		doSendMagicEffect({x=pos.x, y=pos.y+4, z=pos.z}, 2)
		
        end
    return 1
end