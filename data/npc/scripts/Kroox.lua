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
	storage2 = 42535
}

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if (msgcontains(msg, "Sam send me")) then
		       if getPlayerStorageValue(cid, config.storage) == 1 then
npcHandler:say({'Oh, so its you, he wrote me about? Sadly I have no dwarven armor in stock. But I give you the permission to retrive one from the mines. ...', 'The problem is, some giant spiders made the tunnels where the storage is their new home. Good luck.'}, cid)
			setPlayerStorageValue(cid, config.storage2, 1)
		else
			selfSay("I didn't recieve any letter about you from my dear friend, young one.", cid)
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