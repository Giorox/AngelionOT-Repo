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

	if msgcontains(msg, 'pan') then
		npcHandler:say("Have you found a pan for me?", cid)
		talkState[talkUser] = 1
	elseif msgcontains(msg, 'yes') and getPlayerItemCount(cid,2563) >= 1 and talkState[talkUser] == 1 then
		npcHandler:say("A pan! At last! Take this in case you eat something my cousin has cooked.", cid)
		doPlayerRemoveItem(cid,2563,1)
		doPlayerAddItem(cid,8704,1)
	else
		npcHandler:say("$&*@!", cid)
	end
	return true
end 


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())