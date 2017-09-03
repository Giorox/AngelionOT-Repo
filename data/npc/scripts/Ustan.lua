local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local hasItems = {}
local addonStatus = 12004 -- Storage key where addon status will be stored.
local items = {
	-- [index (Don't even need this, but w/e)] = {id, count},
	[1] = {5890, 100},
		[2] = {5902, 50},
			[3] = {2480, 1}
}
local wait = {
	storage = 12005, -- Storage key where time status will be stored.
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
		selfSay('Would you like to wear bear paws like I do? No problem, just bring me 50 bear paws and 50 wolf paws and I\'ll fit them on.', cid)
		talkState[talkUser] = nil
	elseif(msgcontains(msg, 'bear paws') and getCreatureStorage(cid, addonStatus) <= 0) then
		selfSay('Have you brought 50 bear paws and 50 wolf paws?', cid)
		talkState[talkUser] = 3
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) and getPlayerItemCount(cid, 5896) >= 50 and getPlayerItemCount(cid, 5897) >= 50 then
			doPlayerRemoveItem(cid, 5896, 50)
			doPlayerRemoveItem(cid, 5897, 50)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_MAGIC_GREEN)
			doCreatureSetStorage(cid, addonStatus, 3)
			selfSay('Excellent! Like promised, here are your bear paws.', cid)
	if getPlayerSex(cid) == 1 then
			doPlayerAddOutfit(cid, 144, 1)
	elseif getPlayerSex(cid) == 0 then
			doPlayerAddOutfit(cid, 148, 1)
			Topic[talkUser] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
