local stoneItemID = 1355

local stonePos = {x = 33314, y = 31592, z = 15, stackpos = 1}

local teleportPos = {x = 33316, y = 31591, z = 15, stackpos = 254}

local tpToPos = {x = 33328, y = 31592, z = 14, stackpos = 255}
function onUse(cid, item, fromPosition, itemEx, toPosition)
    if (item.itemid == 1945) then
        local stone = getTileItemById(stonePos, stoneItemID)

        if (stone.itemid == stoneItemID) then doRemoveItem(stone.uid) end
        local cueball = getTileItemById(teleportPos, 1387)

        if (cueball.itemid == 1387) then doRemoveItem(cueball.uid) end

        doCreateTeleport(1387, tpToPos, teleportPos)
        doSendMagicEffect(teleportPos, CONST_ME_TELEPORT)
        doSendMagicEffect(stonePos, CONST_ME_POFF)
        doTransformItem(item.uid, item.itemid + 1)
    elseif (item.itemid == 1946) then
        local stone = getTileItemById(stonePos, stoneItemID)

        if (stone.itemid == stoneItemID) then doRemoveItem(stone.uid) end

        local cueball = getTileItemById(teleportPos, 1387)

        if (cueball.itemid == 1387) then doRemoveItem(cueball.uid) end

        doCreateItem(stoneItemID, 1, stonePos)
        doSendMagicEffect(stonePos, CONST_ME_TELEPORT)
        doSendMagicEffect(teleportPos, CONST_ME_POFF)
        doTransformItem(item.uid, item.itemid - 1)
    end
    return TRUE
end