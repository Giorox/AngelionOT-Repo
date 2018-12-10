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

	if msgcontains(msg, 'present box') then
		npcHandler:say("Do you have a suitable present box for me?", cid)
		talkState[talkUser] = 1
	elseif msgcontains(msg, 'yes') and getPlayerItemCount(cid,1990) >= 1 and talkState[talkUser] == 1 then
		npcHandler:say("THANK YOU! Here is a helmet that will serve you well.", cid)
		doPlayerRemoveItem(cid,1990,1)
		doPlayerAddItem(cid,2480,1)
	else
		npcHandler:say("HEY! You don't have one! Stop playing tricks on me or I will give some extra work!", cid)
	end
	return true
end 


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())