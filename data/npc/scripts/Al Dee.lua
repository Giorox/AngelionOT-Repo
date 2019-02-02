local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
        return false
    end

	if msgcontains(msg, 'pick') then
		npcHandler:say("Picks are hard to come by. I trade them only for high quality small axes. Do you want to trade?", cid)
	elseif msgcontains(msg, 'yes') and getPlayerItemCount(cid,2559) >= 1 then 
		npcHandler:say("Splendid! Here take your pickaxe.", cid)
		doPlayerRemoveItem(cid,2559,1)
		doPlayerAddItem(cid,2553,1)
	else
		npcHandler:say("Come back when you have a small axe and want to trade.", cid)
	end
	return true
end 


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())