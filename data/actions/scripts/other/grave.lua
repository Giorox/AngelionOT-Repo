function onUse(cid, item, frompos, item2, topos)

local LustroPos = { x=32739, y=32392, z=14, stackpos=2}
local TapestryPos = { x=32739, y=32393, z=14, stackpos=2}
local tpPos = {x=32712, y=32392, z=13}
local getItem4 = getThingFromPos(tpPos)
local getItem2 = getThingFromPos(LustroPos)
local getItem3 = getThingFromPos(TapestryPos)
local stoneId = 1847

                if getItem2.itemid == stoneId then
				doTeleportThing(cid, tpPos)
				doSendMagicEffect(getCreaturePosition(cid),10)
				doRemoveItem(getItem3.uid,1)
				local ek = doCreateItem(6434,1,LustroPos)
					doSetItemActionId(ek, 39511)
                        end
        end 
