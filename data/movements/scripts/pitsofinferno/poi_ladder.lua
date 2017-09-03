function onStepIn(cid, item, pos)
    local stairs_pos = {x=32854, y=32321, z=11}
    if item.uid == 51886 and isPlayer(cid) == TRUE then
        doCreateItem(5543,1,stairs_pos)
		doTransformItem(item.uid, item.itemid - 1)
    end
    return true
end

function onStepOut(cid, item, pos)
    local stairs_pos = {x=32854, y=32321, z=11, stackpos=1}
    local stairs = getThingfromPos(stairs_pos)
    if item.uid == 51886 and isPlayer(cid) == TRUE then              
		doRemoveItem(stairs.uid)
		doTransformItem(item.uid, item.itemid + 1)
    end
    return true
end
 