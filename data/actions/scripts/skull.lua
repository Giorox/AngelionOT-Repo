function onUse(cid, item, frompos, item2, topos)
       
        local nonremskulls =  -- These are the skulls it cant remove. If player has any of these, the rune wont work.
{
        white = SKULL_WHITE
}

        if isInArray(nonremskulls, getPlayerSkullType(cid)) then
                doPlayerSendCancel(cid,"You can't remove this type of skull.")
                doSendMagicEffect(getPlayerPosition(cid),2)
        else
                db.executeQuery("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ")")
                doCreatureSetSkullType(cid,0)
                doPlayerSendTextMessage(cid,27,"Your frags & your skull have been removed, thanks for donating!")
                doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MAGIC_RED)
                                doSendAnimatedText(getPlayerPosition(cid), "Removed!", 180)
                doRemoveItem(item.uid, 1)
                                doPlayerSetSkullEnd(cid, 0, getPlayerSkullType(cid))

        return TRUE
        end
end