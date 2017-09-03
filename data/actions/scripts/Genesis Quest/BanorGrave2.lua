function onUse(cid, item, fromPosition, itemEx, toPosition)
        local newPosition = {x=32290, y=31906, z=9}
        if(item.itemid == 1406 and item.actionid == 25002) then
                doTeleportThing(cid, newPosition, TRUE)
                doSendMagicEffect(newPosition, CONST_ME_TELEPORT)
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
				doCreatureSay(cid, "You shall be tested by the Gods..", TALKTYPE_ORANGE_1)
        end
        return TRUE
end