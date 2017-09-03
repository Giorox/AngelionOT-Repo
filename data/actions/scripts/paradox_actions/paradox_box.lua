function onUse(cid, item, frompos, item2, topos)
	
	CratePos = {x=32479, y=31900, z=5, stackpos=1}

	if item.actionid == 11003 and item.itemid == 1945 and getPlayerStorageValue(cid, 10008) == -1 then
		doCreateItem(1739,1,CratePos)
		doTransformItem(item.uid,item.itemid+1)	
		setPlayerStorageValue(cid, 10008,1)
	else
		doPlayerSendCancel(cid,"Sorry, not possible.")
	end
end