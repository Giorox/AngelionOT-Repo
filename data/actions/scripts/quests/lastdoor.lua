function onUse(cid, item, frompos, item2, topos)
	if item.uid == 5999 and item.itemid == 1223 then
       if getPlayerStandageValue(cid,10001) == 1 and getPlayerStandageValue(cid,10002) == 1 and getPlayerStandageValue(cid,10003) == 1 and getPlayerStandageValue(cid,10004) == 1 and getPlayerStandageValue(cid,10005) == 1 and getPlayerStandageValue(cid,10006) == 1 and getPlayerStandageValue(cid,10007) == 1 and getPlayerStandageValue(cid,10008) == 1 then
            	doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,  'You absorbed enough energy! You may pass.')
		doTransformItem(item.uid,item.itemid+1)
        else
          	doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,  'Sorry, but you did not absorb enough energy!')
        end
    end