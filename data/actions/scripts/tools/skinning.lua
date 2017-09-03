local SKINS = {
	
[5908] = {
		
[2830] = {25000, 5878},
		
[2871] = {25000, 5878},
		
[2866] = {25000, 5878},
		
[2876] = {25000, 5878},
		
[3090] = {25000, 5878},

		
[4259] = {25000, 5876},
		
[4262] = {25000, 5876},
		
[4256] = {25000, 5876},

		
[3104] = {25000, 5877},
		
[2844] = {25000, 5877},

		
[2881] = {25000, 5948},

		
[2931] = {25000, 5930, 90000, 5893},

		
[3031] = {25000, 5925}
	},
	
[5942] = {
		
[2956] = {25000, 5905},


[2916] = {25000, 5906}
	}
}



function onUse(cid, item, fromPosition, itemEx, toPosition)
	
local skin = SKINS[item.itemid][itemEx.itemid]
	
if(skin == nil) then
		
doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		
return true
	
end

	
local random, effect = math.random(1, 100000), CONST_ME_MAGIC_GREEN
	if(random <= skin[1]) then

doPlayerAddItem(cid, skin[2], 1)
	
elseif(skin[3] and random >= skin[3]) then
		
doPlayerAddItem(cid, skin[4], 1)
	
else
		
effect = CONST_ME_POFF
	
end

	
doSendMagicEffect(toPosition, effect)
	
doTransformItem(itemEx.uid, itemEx.itemid + 1)
	
return true

end
