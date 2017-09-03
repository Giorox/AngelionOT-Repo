function onStepIn(cid, item, pos)
    local stairs_pos = {x=32225, y=32282, z=9}
    if item.uid == 10055 and isPlayer(cid) == TRUE then
        doCreateItem(4836,1,stairs_pos)
    end
    return true
end

function onStepOut(cid, item, pos)
    local stairs_pos = {x=32225, y=32282, z=9}
    local stairs = getThingfromPos(stairs_pos)
    if item.uid == 10055 and isPlayer(cid) == TRUE then              
    doRemoveItem(stairs.uid)
	doCreateItem(424,1,stairs_pos)
    end
    return true
end