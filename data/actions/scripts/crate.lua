local t = {
-- from, to, itemid[, count]
	
{1, 36},
	
{37, 46, 2148, 80},
	
{47, 55, 2148, 50},
	
{56, 64, 2671, 5},
	
{65, 73, 2789, 5},
	
{74, 81, 7620},
	
{82, 87, 7618},
	
{88, 92, 9811},
	
{93, 96, 9808},
	
{97, 100, 2213}
}



function doCreatureSayWithRadius(cid, text, type, radiusx, radiusy, position)
	
for i, tid in ipairs(getSpectators(position or getCreaturePosition(cid), radiusx, radiusy, false)) do

if(isPlayer(tid) == TRUE) then
			
doCreatureSay(cid, text, type, false, tid, position or getCreaturePosition(cid))
		
end
	
end
	
return TRUE

end



function onUse(cid, item, fromPosition, itemEx, toPosition)
	
if os.time() - getPlayerStorageValue(cid, 65000) >= 3600 then
		
setPlayerStorageValue(cid, 65000, os.time())
		
local rand = math.random(100)
		
for i = 1, #t do
			
local k = t[i]
			
if rand >= k[1] and rand <= k[2] then
				
if k[3] then
					
local itemid, count, article = k[3], k[4] or 1, getItemInfo(k[3]).article
					
doPlayerAddItem(cid, itemid, count)
					
doCreatureSayWithRadius(cid, "You found " .. (count > 1 and count or (article ~= "" and article or "")) .. " " .. (count > 1 and getItemInfo(itemid).plural or getItemNameById(itemid)) .. ".", TALKTYPE_ORANGE_1, 1, 1)
				
else
					
doCreatureSayWithRadius(cid, "You found nothing useful.", TALKTYPE_ORANGE_1, 1, 1)
	
end
				
break
			
end
		
end
	
else
		
doCreatureSayWithRadius(cid, "You found nothing useful.", TALKTYPE_ORANGE_1, 1, 1)
	
end
	
return true

end