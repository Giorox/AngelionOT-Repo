local quest_storage = 17935

local sub_quest_str = 18500	
local locations =
	{
		
[1] = {pos = {x = 33268, y = 31835, z = 1}, 
txt = 'You hold the skull up high. You can resist the urge to have it look through a telescope though.'},

[2] = {pos = {x = 32711, y = 31669, z = 1}, 
txt = 'You hold up the skull and let it take a peek over the beautiful elven town through the dense leaves.'},

[3] = {pos = {x = 32536, y = 31773, z = 1}, 
txt = 'Thanita gives you a really strange look as you hold up the skull, but oh well.'},
[4] = {pos = {x = 33213, y = 32454, z = 1}, 
txt = 'That was a real easy one. And you are used to getting strange looks now, so whatever!'},
	
[5] = {pos = {x = 33150, y = 32843, z = 2}, 
txt = 'Wow, it\'s hot up here. Luckily the skull can\'t get a sunburn anymore, but you can, so you better descend again!'},
[6] = {pos = {x = 32581, y = 32742, z = 4}, 
txt = 'Considering that higher places around here aren\'t that easy to reach, you think the view from here is tolerably good.'},
		
[7] = {pos = {x = 32346, y = 32809, z = 2}, 
txt = 'Yep, that\'s a pretty high spot. If Lazaran ever sees what the skull sees, he\'d be pretty satisfied with that nice view.'},
[8] = {pos = {x = 32790, y = 31238, z = 3}, 
txt = 'Well, there are higher spots around here, but none of them is as easily reachable as this one. It just has to suffice.'},
[9] = {pos = {x = 32236, y = 31095, z = 2}, 
txt = 'Nice! White in white as far as the eye can see. Time to leave before your fingers turn into icicles.'},
[10] = {pos = {x = 32344, y = 32264, z = 0}, 
txt = 'That\'s definitely one of the highest spots in whole Tibia. If that\'s not simply perfect you don\'t know what it is.'},

[11] = {pos = {x = 32318, y = 31753, z = 0}, 
txt = 'What a beautiful view. Worthy of a Queen indeed! Time to head back to Lazaran and show him what you got.'},
	}



function onUse(cid, item, fromPosition, itemEx, toPosition)
	
if (getPlayerStorageValue(cid, quest_storage) == 5) then
		
for k, i in ipairs(locations) do
		
local from = {x = i.pos.x - 5, y = i.pos.y - 5, z = i.pos.z} 			
		
local tooo = {x = i.pos.x + 5, y = i.pos.y + 5, z = i.pos.z} 			
		
if isInRange(getCreaturePosition(cid), from, tooo) then				
		
if (getPlayerStorageValue(cid, sub_quest_str + k) ~= 1) then
					
doCreatureSay(cid, i.txt, TALKTYPE_ORANGE_1)
					
doPlayerSetStorageValue(cid, sub_quest_str + k, 1)
				
end
			
end
		
end
		
for i = 1, 11 do
			
if (getPlayerStorageValue(cid, sub_quest_str + i) ~= 1) then
				
return true
			
end
		
end
		
doPlayerSetStorageValue(cid, quest_storage, 6)
end
	
return true

end