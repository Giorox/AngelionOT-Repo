local config = {
	hardcoreManaSpent = getConfigValue("addManaSpentInPvPZone"),
	manaCost = 300,
	soulCost = 2,
}

local spheres = {
	[7759] = {3, 7},
	[7760] = {1, 5},
	[7761] = {2, 6},
	[7762] = {4, 8}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isInArray({33268, 33269}, toPosition.x) and toPosition.y == 31830 and toPosition.z == 10 and getPlayerStorageValue(cid, 65100) > 0 then
		if not isInArray(spheres[item.itemid], getPlayerVocation(cid)) then
			return false
		elseif isInArray({7915, 7916}, itemEx.itemid) == TRUE then
			doCreatureSay(cid, 'Turn off the machine first.', TALKTYPE_ORANGE_1)
			return true
		else
			setPlayerStorageValue(cid, 65102, math.max(1, getPlayerStorageValue(cid, 65102) + 1))
			doSendMagicEffect(toPosition, CONST_ME_PURPLEENERGY)
			doChangeTypeItem(item.uid, item.type - 1)
			return true
		end
	end

	if(item.itemid == 2147 and itemEx.itemid == 2342) then
		doTransformItem(itemEx.uid, 2343)
		doDecayItem(itemEx.uid)
		doRemoveItem(item.uid, 1)

		doSendMagicEffect(toPosition, CONST_ME_MAGIC_RED)
		return true
	end

	if(item.itemid == 7760 and isInArray({9934, 10022}, itemEx.itemid)) then
		doTransformItem(itemEx.uid, 9933)
		doRemoveItem(item.uid, 1)

		doSendMagicEffect(toPosition, CONST_ME_MAGIC_RED)
		return true
	end

	if(isInArray(enchantableGems, item.itemid)) then
		local subtype = item.type
		if(subtype == 0) then
			subtype = 1
		end

		local mana = config.manaCost * subtype
		if(getPlayerMana(cid) < mana) then
			doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTENOUGHMANA)
			return true
		end

		local soul = config.soulCost * subtype
		if(getPlayerSoul(cid) < soul) then
			doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTENOUGHSOUL)
			return true
		end

		local a = table.find(enchantableGems, item.itemid)
		if(a == nil or not isInArray(enchantingAltars[a], itemEx.itemid)) then
			return false
		end

		doPlayerAddMana(cid, -mana)
		doPlayerAddSoul(cid, -soul)

		doTransformItem(item.uid, enchantedGems[a])
		if(not getPlayerFlagValue(cid, PlayerFlag_NotGainMana) and (not getTileInfo(getThingPosition(cid)).hardcore or config.hardcoreManaSpent)) then
			doPlayerAddSpentMana(cid, mana)
		end

		doSendMagicEffect(fromPosition, CONST_ME_HOLYDAMAGE)
		return true
	end
 
	if(isInArray(enchantedGems, item.itemid)) then
		if(not isInArray(enchantableItems, itemEx.itemid)) then
			if((item.itemid == 7761) and ((itemEx.itemid == 9954) or (itemEx.itemid == 9949))) then
				doTransformItem(itemEx.uid, itemEx.itemid-1)
				doDecayItem(itemEx.uid)
				doPlayerRemoveItem(cid, 7761, 1)
				return true
			else
				doSendMagicEffect(fromPosition, CONST_ME_POFF)
				return false
			end
		end

		local b = table.find(enchantedGems, item.itemid)
		if(b == nil) then
			return false
		end

		local subtype = itemEx.type
		if(not isInArray({2544, 8905}, itemEx.itemid)) then
			subtype = 1000
		end

		doTransformItem(itemEx.uid, enchantedItems[itemEx.itemid][b], subtype)
		doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_HOLYDAMAGE)
		doDecayItem(itemEx.uid)

		doRemoveItem(item.uid, 1)
		return true
	end
	

	return false
end