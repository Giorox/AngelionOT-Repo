function onUse(cid, item, frompos, item2, topos)

local stonePos = { x=32739, y=32392, z=14, stackpos=2}
local stonePos1 = { x=32739, y=32393, z=14, stackpos=2}
local getItem = getThingFromPos(stonePos)
local getItem1 = getThingFromPos(stonePos1)
local stoneId = 6434

                if getItem.itemid == stoneId then
				doRemoveItem(getItem.uid,1)
				doCreateItem(6434,1,stonePos1)
                        end
        end 
