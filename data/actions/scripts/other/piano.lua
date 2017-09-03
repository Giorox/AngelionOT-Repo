function onUse(cid, item, fromPosition, itemEx, toPosition)
        local newPosition = {x=32403, y=32794, z=9}
        if(item.itemid == 6123 and item.actionid == 33216) then
                doTeleportThing(cid, newPosition, TRUE)
                doSendMagicEffect(newPosition, CONST_ME_SOUND_GREEN)
                doSendMagicEffect(fromPosition, CONST_ME_SOUND_GREEN)
        end
        return TRUE
end