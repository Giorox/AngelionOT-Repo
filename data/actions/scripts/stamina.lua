function onUse(cid, item, fromPosition, itemEx, toPosition)
    local cfg = {}
    cfg.refuel = 42 * 60 * 1000
    if(getPlayerStamina(cid) >= cfg.refuel) then
        doPlayerSendCancel(cid, "Your stamina is already full.")
    elseif(not isPremium(cid)) then
        doPlayerSendCancel(cid, "You must have a premium account.")
    else
        doPlayerSetStamina(cid, cfg.refuel)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your stamina has been refilled.")
        doRemoveItem(item.uid)
    end
    return true
end