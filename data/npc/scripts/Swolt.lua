local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local Topic = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if (msgcontains(msg, "hello") or msgcontains(msg, "hi")) and (not npcHandler:isFocused(cid)) then
		npcHandler:say("Hello, ".. getCreatureName(cid) ..".", cid, TRUE) -- fixzz
		npcHandler:addFocus(cid)
		Topic[talkUser] = 0
	elseif(not npcHandler:isFocused(cid)) then
		return false
	elseif msgcontains(msg, "bye") or msgcontains(msg, "farewell") then
		npcHandler:say("Bye.", cid, TRUE) -- moar here too
		Topic[talkUser] = nil
		npcHandler:releaseFocus(cid)
	elseif msgcontains(msg, "rice") and getPlayerStorageValue(cid, 85300) >= 4 then
		npcHandler:say("Aaargh! Cael and his strange thoughts! He bugged me so long about the lizard culture that I eventually agreed to prepare that rice for you if you need it. I need one ripe rice plant to prepare ten rice balls. OK?", cid)
		Topic[talkUser] = 1
	elseif Topic[talkUser] == 1 and msgcontains(msg, "yes") and doPlayerRemoveItem(cid, 11239, 1) == TRUE then
		npcHandler:say("Here you go. 10 rice balls. Hope you buy a beer with them at least. ", cid)
		doPlayerAddItem(cid, 11240, 10)
		Topic[talkUser] = 0
	elseif msgcontains(msg, "trade") then
		local items = {
			{name="bread", id=2689, buy=4},
			{name="cheese", id=2696, buy=6},
			{name="ham", id=2671, buy=8},
			{name="meat", id=2666, buy=5},
			{name="mug of water", id=2012, buy=1, subType = 1},
			{name="mug of beer", id=2012, buy=3, subType = 3}
		}
		openShopWindow(cid, items,
			function(cid, itemid, subType, amount, ignoreCap, inBackpacks)
				customCallbackOnBuy(cid, itemid, subType, amount, ignoreCap, inBackpacks, items)
			end,
			function(cid, itemid, subType, amount, ignoreCap, inBackpacks)
				customCallbackOnSell(cid, itemid, subType, amount, ignoreCap, inBackpacks, items)
			end
		)
		npcHandler:say("Of course, just browse through my wares.", cid) -- buy fix 7gp
		Topic[talkUser] = 0
	end
	return TRUE
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "Bye.") -- buy fix
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)