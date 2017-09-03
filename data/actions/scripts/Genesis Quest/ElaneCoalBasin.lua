function onUse(cid, item, fromPosition, itemEx, toPosition)
        local newPosition = {x=32761, y=31656, z=8}
        if(item.itemid == 1483 and item.actionid == 25003) then
                doTeleportThing(cid, newPosition, TRUE)
                doSendMagicEffect(newPosition, CONST_ME_TELEPORT)
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
				doCreatureSay(cid, "The Whirlwind of the elves revolves around you..", TALKTYPE_ORANGE_1)
        end
        return TRUE
end