  -- rook lever by Sasir~
local posi3 = {x=32102, y=32205, z=8} --
poss = {
[1] = {x=32099, y=32205, z=8},
[2] = {x=32100, y=32205, z=8},
[3] = {x=32101, y=32205, z=8}
}

local lever = {
[1] = {x=32098, y=32204, z=8},
[2] = {x=32104, y=32204, z=8}
}
local itemids = 5770
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if item.itemid == 1945 then
                doCreateItem(itemids,poss[1])
                if getTileItemById(poss[2],4645).itemid ~= nil then
                        doTransformItem(getTileItemById(poss[2],4645).uid,itemids)
                end
                if getTileItemById(poss[3],4647).itemid > 0 then
                        doTransformItem(getTileItemById(poss[3],4647).uid,itemids)
                end
                for i=1,#lever do
                        if lever[i].x == fromPosition.x then
                                o = i
                        end
                end
                if o == 1 then
                        b = 2
                else
                        b = 1
                end
                doTransformItem(item.uid,item.itemid+1)
                doTransformItem(getTileItemById(lever[b],1945).uid,1946)
        elseif item.itemid == 1946 then
                for p = 1,#poss do
                doRelocate(poss[p], posi3)
                end
                for z =1,#poss do
                                poss[z].stackpos = 254
                                if getThingFromPos(poss[z]).itemid > 1000 then
                                        doRemoveItem(getThingFromPos(poss[z]).uid)
                                end
                                poss[z].stackpos = 1
                                if getThingFromPos(poss[z]).itemid > 1000 then
                                        doRemoveItem(getThingFromPos(poss[z]).uid)
                                end

                end
                for i=1,#lever do
                        if lever[i].x == toPosition.x then
                                o = i
                        end
                end
                if o == 1 then
                        b = 2
                else
                        b = 1
                end
                doCreateItem(4616,poss[1])
                doCreateItem(351,poss[2])
                doCreateItem(351,poss[3])
                doCreateItem(4645,poss[2])
                doCreateItem(4647,poss[3])
                doTransformItem(item.uid,item.itemid-1)
                doTransformItem(getTileItemById(lever[b],1946).uid,1945)
        end
        return TRUE
end 