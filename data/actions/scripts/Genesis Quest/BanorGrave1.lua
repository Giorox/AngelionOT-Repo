function onUse(cid, item, fromPosition, itemEx, toPosition)
        local newPosition = {x=32299, y=31905, z=8}
        if(item.itemid == 1406 and item.actionid == 25001) then
                doTeleportThing(cid, newPosition, TRUE)
                doSendMagicEffect(newPosition, CONST_ME_TELEPORT)
                doSendMagicEffect(fromPosition, CONST_ME_POFF)
				doCreatureSay(cid, "You feel the Necromantic powers that binded the 2 graves together..", TALKTYPE_ORANGE_1)
        end
        return TRUE
end