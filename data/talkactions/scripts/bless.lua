-- !blessing by leo
local cost = 50000 -- Cost in gp.

function onSay(cid, words, param)




if getPlayerBlessing(cid, 5) == TRUE then
doPlayerSendCancel(cid, "You have already have been blessed.")
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
return TRUE
end

if doPlayerRemoveMoney(cid, cost) == TRUE then
doPlayerAddBlessing(cid, 1)
doPlayerAddBlessing(cid, 2)
doPlayerAddBlessing(cid, 3)
doPlayerAddBlessing(cid, 4)
doPlayerAddBlessing(cid, 5)
doSendAnimatedText(getCreaturePosition(cid), 'Blessed!!!', TEXTCOLOR_WHITE)
return TRUE
else
doPlayerPopupFYI(cid, "You need to have "..cost.."gp to buy blessings.")
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
return TRUE
end



end