local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local hasItems = {}
local addonStatus = 12000 -- Storage key where addon status will be stored.
local items = {
	-- [index (Don't even need this, but w/e)] = {id, count},
	[1] = {5878, 100}
}
local wait = {
	storage = 12001, -- Storage key where time status will be stored.
	_time = 2 * 3600 -- Time to wait to get your addon.
}
local outfit = {
	types = {128, 136},
	addon = 1
}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)				end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)				end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()							npcHandler:onThink()							end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if(msgcontains(msg, 'addon') and getCreatureStorage(cid, addonStatus) <= 0) then
		selfSay('Sorry, the backpack I wear is not for sale. It\'s handmade from rare minotaur leather.', cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'minotaur leather') and talkState[talkUser] == 1 and getCreatureStorage(cid, addonStatus) <= 0) then
		selfSay('Well, if you really like this backpack, I could make one for you, but minotaur leather is hard to come by these days. Are you willing to put some work into this?', cid)
		talkState[talkUser] = 2
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2 and getCreatureStorage(cid, addonStatus) <= 0) then
		doCreatureSetStorage(cid, addonStatus, 1)
		selfSay('Alright then, if you bring me 100 pieces of fine minotaur leather I will see what I can do for you. You probably have to kill really many minotaurs though... so good luck!', cid)
		talkState[talkUser] = nil
	elseif(msgcontains(msg, 'backpack') and getCreatureStorage(cid, addonStatus) == 1) then
		selfSay('Ah, right, almost forgot about the backpack! Have you brought me 100 pieces of minotaur leather as requested?', cid)
		talkState[talkUser] = 3
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then
		hasItems[talkUser] = true
		for _, data in ipairs(items) do
			if(getPlayerItemCount(cid, data[1]) < data[2]) then
				hasItems[talkUser] = false
			end
		end
		if(hasItems[talkUser]) then
			for _, data in ipairs(items) do
				doPlayerRemoveItem(cid, data[1], data[2])
			end
			exhaustion.set(cid, wait.storage, wait._time)
			doCreatureSetStorage(cid, addonStatus, 2)
			selfSay('Great! Alright, I need a while to finish this backpack for you. Come ask me later, okay?', cid)
		else
			selfSay('You don\'t have required items.', cid)
		end
		hasItems[talkUser] = nil
		talkState[talkUser] = nil
	elseif(msgcontains(msg, 'addon') and getCreatureStorage(cid, addonStatus) == 2) then
		if(not exhaustion.get(cid, wait.storage)) then
			for _, _outfit in ipairs(outfit.types) do
				doPlayerAddOutfit(cid, _outfit, outfit.addon)
			end
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
			doCreatureSetStorage(cid, addonStatus, 3)
			selfSay('Just in time! Your backpack is finished. Here you go, I hope you like it.', cid)
		else
			selfSay('Come back later, please.', cid)
		end
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
