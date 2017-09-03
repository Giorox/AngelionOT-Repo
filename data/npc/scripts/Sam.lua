local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)				npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()						npcHandler:onThink()					end

local config = {
	storage = 18256,
}

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if (msgcontains(msg, "old backpack")) then
		if (getPlayerItemCount(cid, 3960) >= 1) and doPlayerRemoveItem(cid,3960,1)then
			npcHandler:say({'Thank you very much! This brings back good old memories! Please, as a reward, travel to Kazordoon and ask my old friend Kroox to provide you a special dwarven armor. ...', 'I will mail him about you immediately. Just tell him, his old buddy sam is sending you.'}, cid)
			setPlayerStorageValue(cid, config.storage, 1)
		else
			selfSay("You don't have my backpack.", cid)
		end
		talkState[talkUser] = 0
	elseif(msgcontains(msg, 'no') and isInArray({1}, talkState[talkUser])) then
		talkState[talkUser] = 0
		selfSay("Bye.", cid)
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())