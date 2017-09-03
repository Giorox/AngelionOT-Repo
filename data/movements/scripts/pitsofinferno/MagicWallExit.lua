local pos = {x=32791, y=32331, z=10}
function onStepIn(cid, item, position, fromPosition)
    if isPlayer(cid) == TRUE then
             doTeleportThing(cid, pos, TRUE)
             doSendMagicEffect(pos, 10)
    return TRUE
end  
end
