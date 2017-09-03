local blessings = {
"\nWisdom of Solitude", 
"\nSpark of the Phoenix", 
"\nFire of the Suns", 
"\nSpiritual Shielding", 
"\nEmbrace of Tibia"}


function onUse(cid, item, fromPosition, itemEx, toPosition)
	
local result = "Received blessings:"
	
for i = 1, 5 do
		
result = getPlayerBlessing(cid, i) and result .. blessings[i] or result
	
end
	
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 20 > result:len() and "No blessings received." or result)
	
return TRUE

end
