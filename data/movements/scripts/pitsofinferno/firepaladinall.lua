local zabierz = 300
local kolor = 163

function onStepIn(cid, item, pos)

local zycie = getCreatureHealth(cid)
local topos = getPlayerPosition(cid)

if item.actionid == 9883 and isPaladin(cid) == FALSE then
doCreatureAddHealth(cid, -zycie)
doSendAnimatedText(topos, zycie, kolor)
doCreatureSay(cid, "You have choosen the wrong path!", TALKTYPE_ORANGE_1)
doSendMagicEffect(getPlayerPosition(cid), 15)

elseif item.actionid == 9883 and isPaladin(cid) == TRUE then
doCreatureAddHealth(cid, -zabierz)
doSendAnimatedText(topos, zabierz, kolor)
doSendMagicEffect(getPlayerPosition(cid), 15)
end

return 1
end