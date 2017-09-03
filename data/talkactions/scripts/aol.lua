function onSay(cid, words, param)
if doPlayerRemoveMoney(cid, 50000) == TRUE then
doPlayerAddItem(cid, 2173, 1)
else
doPlayerSendCancel(cid, 'You don\'t have enough money.')
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end
return TRUE
end
