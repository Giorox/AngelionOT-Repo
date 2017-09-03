function onStepIn(cid, item, position, fromPosition)
 
local stonePos = { x=32849, y=32282, z=10, stackpos=1 }
local getItem = getThingFromPos(stonePos)
local stoneId = 1304
local leverPos = { x=32850, y=32268, z=10, stackpos=1 } -- change to the lever id
local getLever = getThingFromPos(leverPos)
local LeverId = 1945

                if(isPlayer(cid) == TRUE and getItem.itemid == stoneId) then
                else
                        doPlayerSendTextMessage(cid,22, "You hear a rumbling from far away.")
                        doCreateItem(stoneId, 1, stonePos)
						doRemoveItem(getThingfromPos(leverPos).uid, 1)
						local cer = doCreateItem(LeverId, 1, leverPos)
						doSetItemActionId(cer, 42880)
						doSendMagicEffect(stonePos,2)
						stonePos.stackpos = 253
		if getThingFromPos(stonePos).itemid > 0 then
		doMoveCreature(getThingFromPos(stonePos).uid, EAST)
		end
                return TRUE
        end 
		end