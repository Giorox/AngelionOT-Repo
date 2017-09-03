function saveRepeat(cid)
    if not isPlayer(cid) then return true end
    doPlayerSave(cid)
    doPlayerSendTextMessage(cid,19, 'Your character\'s progress is saved.')
    doSendMagicEffect(getThingPos(cid), 11)
    save = addEvent(saveRepeat, math.random(30,43) *60*1000, cid)
end

function onLogin(cid)
    save = addEvent(saveRepeat, math.random(30,43)*60*1000, cid)
    return true
end

function onLogout(cid)
    stopEvent(save)
    return true
end