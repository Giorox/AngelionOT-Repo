local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local hasItems = {}
local addonStatus = 12002 -- Storage key where addon status will be stored.
local items = {
	-- [index (Don't even need this, but w/e)] = {id, count},
	[1] = {5890, 100},
		[2] = {5902, 50},
			[3] = {2480, 1}
}
local wait = {
	storage = 12003, -- Storage key where time status will be stored.
	_time = 0 -- Time to wait to get your addon.
}
local outfit = {
	types = {128, 136},
	addon = 2
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
		selfSay('Pretty, isn\'t it? My friend Amber taught me how to make it, but I could help you with one if you like. What do you say?', cid)
		talkState[talkUser] = 1
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1 and getCreatureStorage(cid, addonStatus) <= 0) then
		selfSay('Okay, here we go, listen closely! I need a few things... a basic hat of course, maybe a legion helmet would do. Then about 100 chicken feathers... and 50 honeycombs as glue. That\'s it, come back to me once you gathered it!', cid)
		talkState[talkUser] = nil
		doCreatureSetStorage(cid, addonStatus, 1)
	elseif(msgcontains(msg, 'hat') and getCreatureStorage(cid, addonStatus) == 1) then
		selfSay('Oh, you\'re back already? Did you bring a legion helmet, 100 chicken feathers and 50 honeycombs?', cid)
		talkState[talkUser] = 3
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) and getPlayerItemCount(cid, 5890) >= 100 and getPlayerItemCount(cid, 5902) >= 50 and getPlayerItemCount(cid, 2480) >= 1 then
			doPlayerRemoveItem(cid, 5890, 100)
			doPlayerRemoveItem(cid, 5902, 50)
			doPlayerRemoveItem(cid, 2480, 1)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
			doCreatureSetStorage(cid, addonStatus, 3)
			selfSay('Great job! That must have taken a lot of work. Okay, you put it like this... then glue like this... here!', cid)
	if getPlayerSex(cid) == 1 then
			doPlayerAddOutfit(cid, 128, 2)
	elseif getPlayerSex(cid) == 0 then
			doPlayerAddOutfit(cid, 136, 2)
			Topic[talkUser] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
