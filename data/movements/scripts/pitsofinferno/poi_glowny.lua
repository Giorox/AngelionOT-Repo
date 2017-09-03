local stonePos = {x=32826, y=32274, z= 11}
local novaPos = {x=32826, y=32273, z=12} 

function tileChecker(pos)
    local myTable = {}
    if (type(pos) == 'table') then
        for i = 1, 5 do
            pos.stackpos = i
            local thisID = getThingFromPos(pos).itemid
            if thisID > 1 then
                table.insert(myTable, thisID)
            end
        end
    end
    return #myTable > 0 and myTable or nil
end

local function findItem(pos, t)
    if (type(pos) == 'table' and type(t) == 'table') then
        for _i, i in ipairs(tileChecker(pos)) do
            if isInArray(t, i) then
                pos.stackpos = _i
                ret = getThingFromPos(pos).uid
                break
            end
        end
    end
    return ret
end

local function reCreate()
    doRemoveItem(findItem(stonePos, {1285}))
end

function onStepIn(cid, item, position, fromPosition)
    if (item.uid == 14550 and isPlayer(cid) == TRUE) then
        doTeleportThing(cid, novaPos)
        doCreateItem(1285, 1, stonePos)
        addEvent(reCreate, 5 * 1000)
    end 
    return TRUE
end
