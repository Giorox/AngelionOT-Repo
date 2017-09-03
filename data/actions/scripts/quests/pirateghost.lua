local function Eliminar()
local piedra2 = {x = 32256, y = 32790, z = 7, stackpos = 1}
local piedrapos = getThingfromPos(piedra2)
	doRemoveItem(piedrapos.uid, 1)
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
local piedra = {x = 32256, y = 32790, z = 7}
	if item.itemid == 2006 and item.actionid == 18899 then
		if getPlayerStorageValue(cid, 1889) == 26 then
			if fromPosition.x == CONTAINER_POSITION then
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_EXPLOSIONHIT)
				doSummonCreature("Pirate Ghost", { x =32257, y =32791, z =7})
				setPlayerStorageValue(cid, 1889, 27)
				doPlayerRemoveItem(cid, 2006, 1)
				doCreateItem(1304, 1, piedra)
				addEvent(Eliminar, 20*1000)
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need hold the item on you.")
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You arent a inquisition member")
		end
	end
    return TRUE
end