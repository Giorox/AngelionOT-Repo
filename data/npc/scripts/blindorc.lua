local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local Topic = {}
local Amount = {}
local Price = {}
local Type = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if msgcontains(msg, "charach") and (not npcHandler:isFocused(cid)) then
		selfSay("Ikem Charach maruk.", cid, TRUE)
		npcHandler:addFocus(cid)
		Topic[talkUser] = 0
		Amount[talkUser] = 0
		Price[talkUser] = 0
		Type[talkUser] = 0
		return true
	elseif (not npcHandler:isFocused(cid)) then
		npcHandler:say("Buta humak!", cid, TRUE)
	elseif msgcontains(msg, "futchi") then
		selfSay("Futchi.", cid, TRUE)
		npcHandler:releaseFocus(cid)
		Topic[talkUser] = 0
		Amount[talkUser] = 0
		Price[talkUser] = 0
		Type[talkUser] = 0
	elseif msgcontains(msg, "ikem") and msgcontains(msg, "goshak") then
		npcHandler:say("Ikem pashak porak, bata, dora. Ba goshak maruk?", cid)
		Topic[talkUser] = 0
		Amount[talkUser] = 0
		Price[talkUser] = 0
		Type[talkUser] = 0
	elseif msgcontains(msg, "goshak") and msgcontains(msg, "porak") then
		npcHandler:say("Ikem pashak charcha, burka, burka bata, hakhak. Ba goshak maruk?", cid)
		Topic[talkUser] = 0
		Amount[talkUser] = 0
		Price[talkUser] = 0
		Type[talkUser] = 0
	elseif msgcontains(msg, "goshak") and msgcontains(msg, "charcha") then
		npcHandler:say("Maruk goshak ta?", cid)
		Topic[talkUser] = 1
		Amount[talkUser] = 1
		Price[talkUser] = 25
		Type[talkUser] = 2385
	elseif msgcontains(msg, "goshak") and msgcontains(msg, "burka") and msgcontains(msg, "bata") then
		npcHandler:say("Maruk goshak ta?", cid)
		Topic[talkUser] = 1
		Amount[talkUser] = 1
		Price[talkUser] = 85
		Type[talkUser] = 2376
	elseif msgcontains(msg, "goshak") and msgcontains(msg, "burka") then
		npcHandler:say("Maruk goshak ta?", cid)
		Topic[talkUser] = 1
		Amount[talkUser] = 1
		Price[talkUser] = 30
		Type[talkUser] = 2406
	elseif msgcontains(msg, "goshak") and msgcontains(msg, "hakhak") then
		npcHandler:say("Maruk goshak ta?", cid)
		Topic[talkUser] = 1
		Amount[talkUser] = 1
		Price[talkUser] = 85
		Type[talkUser] = 2388
	elseif msgcontains(msg, "goshak") and msgcontains(msg, "bata") then
		npcHandler:say("Ikem pashak aka bora, tulak bora, grofa. Ba goshak maruk?", cid)
		Topic[talkUser] = 0
		Amount[talkUser] = 0
		Price[talkUser] = 0
		Type[talkUser] = 0
	elseif msgcontains(msg, "goshak") and msgcontains(msg, "tulak") and msgcontains(msg, "bora") then
		npcHandler:say("Maruk goshak ta?", cid)
		Topic[talkUser] = 1
		Amount[talkUser] = 1
		Price[talkUser] = 90
		Type[talkUser] = 2484
	elseif msgcontains(msg, "goshak") and msgcontains(msg, "bora") then
		npcHandler:say("Maruk goshak ta?", cid)
		Topic[talkUser] = 1
		Amount[talkUser] = 1
		Price[talkUser] = 25
		Type[talkUser] = 2467
	elseif msgcontains(msg, "goshak") and msgcontains(msg, "grofa") then
		npcHandler:say("Maruk goshak ta?", cid)
		Topic[talkUser] = 1
		Amount[talkUser] = 1
		Price[talkUser] = 60
		Type[talkUser] = 2482
	elseif msgcontains(msg, "goshak") and msgcontains(msg, "dora") then
		npcHandler:say("Ikem pashak donga. Ba goshak maruk?", cid)
		Topic[talkUser] = 0
		Amount[talkUser] = 0
		Price[talkUser] = 0
		Type[talkUser] = 0
	elseif msgcontains(msg, "goshak") and msgcontains(msg, "donga") then
		npcHandler:say("Maruk goshak ta?", cid)
		Topic[talkUser] = 1
		Amount[talkUser] = 1
		Price[talkUser] = 65
		Type[talkUser] = 2511
	elseif msgcontains(msg, "goshak") and msgcontains(msg, "batuk") then
		npcHandler:say("Ahhhh, maruk goshak batuk?", cid)
		Topic[talkUser] = 1
		Amount[talkUser] = 1
		Price[talkUser] = 400
		Type[talkUser] = 2456
	elseif msgcontains(msg, "goshak") and msgcontains(msg, "pixo") then
		npcHandler:say("Maruk goshak tefar pixo ul batuk?", cid)
		Topic[talkUser] = 1
		Amount[talkUser] = 10
		Price[talkUser] = 30
		Type[talkUser] = 2544
	elseif Topic[talkUser] == 1 then
		if msgcontains(msg, "mok") then
			if getPlayerMoney(cid) >= Price[talkUser] then
				npcHandler:say("Maruk rambo zambo!", cid)
				doPlayerRemoveMoney(cid, Price[talkUser])
				doPlayerAddItem(cid, Type[talkUser], Amount[talkUser])
				Topic[talkUser] = 0
				Amount[talkUser] = 0
				Price[talkUser] = 0
				Type[talkUser] = 0
			else
				npcHandler:say("Maruk nixda!", cid)
				Topic[talkUser] = 0
				Amount[talkUser] = 0
				Price[talkUser] = 0
				Type[talkUser] = 0
			end
		else
			npcHandler:say("Buta maruk klamuk!", cid)
			Topic[talkUser] = 0
			Amount[talkUser] = 0
			Price[talkUser] = 0
			Type[talkUser] = 0
		end
	elseif msgcontains(msg, "trade") then
		npcHandler:say("Uh?", cid)
		Topic[talkUser] = 0
		Amount[talkUser] = 0
		Price[talkUser] = 0
		Type[talkUser] = 0
	end
	return TRUE
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "Futchi.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)