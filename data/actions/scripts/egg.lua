function onUse(cid, item, fromPosition, itemEx, toPosition)
	
if itemEx.actionid == 62378 then
	
doRemoveItem(item.uid)
    	
setPlayerStorageValue(cid, 62378, 1)
	
doSendMagicEffect(toPosition, CONST_ME_WATERSPLASH)

end

return true

end