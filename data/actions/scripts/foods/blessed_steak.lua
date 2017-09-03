local exhaust = createConditionObject(CONDITION_EXHAUST)

setConditionParam(exhaust, CONDITION_PARAM_TICKS, (getConfigInfo('timeBetweenExActions') - 100))


function onUse(cid, item, fromPosition, itemEx, toPosition)
	
local food = SPECIAL_FOODS[item.itemid]
	if(food == nil) then
		
return false
	
end

	
if(not doAddCondition(cid, exhaust)) then
		
return true
	
end

	
doCreatureAddMana(cid, getCreatureMaxMana(cid) - getCreatureMana(cid))
	doCreatureSay(itemEx.uid, "Aaaah...", TALKTYPE_ORANGE_1)
	
return true

end
