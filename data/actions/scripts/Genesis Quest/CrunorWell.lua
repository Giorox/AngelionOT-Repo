function onUse(cid, item, fromPosition, itemEx, toPosition)
        local newPosition = {x=32702, y=32296, z=11}
        if(item.itemid == 1362 and item.actionid == 25000) then
                doTeleportThing(cid, newPosition, TRUE)
                doSendMagicEffect(newPosition, CONST_ME_TELEPORT)
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
				doCreatureSay(cid, "You enter a state of unconsciousness..", TALKTYPE_ORANGE_1)
        end
        return TRUE
end