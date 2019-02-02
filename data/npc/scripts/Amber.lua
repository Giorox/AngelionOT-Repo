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

	if msgcontains(msg, 'book') then
		npcHandler:say("Do you bring me my notebook?", cid)
	elseif msgcontains(msg, 'yes') and getPlayerItemCount(cid,2325) >= 1 then 
		npcHandler:say("Excellent. Here, take this short sword as a reward.", cid)
		doPlayerRemoveItem(cid,2325,1)
		doPlayerAddItem(cid,2406,1)
	else
		pcHandler:say("Come back when you have my notebook.", cid)
	end
	return true
end 


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())