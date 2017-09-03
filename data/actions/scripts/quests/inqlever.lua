function onUse(cid, item)

if item.uid == 6076 then
	setPlayerStorageValue(cid,6079,1)
    doCreatureSay(cid, "You may now acess the rewards room", TALKTYPE_ORANGE_1)
    doSendMagicEffect(getCreaturePosition(cid), 15)

end
return doPlayerSendCancel(cid, "You already have acess.")
end