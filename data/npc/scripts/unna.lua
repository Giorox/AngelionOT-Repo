local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)
	npcHandler:onCreatureAppear(cid)
end

function onCreatureDisappear(cid)
	npcHandler:onCreatureDisappear(cid)
end

function onCreatureSay(cid, type, msg)
	npcHandler:onCreatureSay(cid, type, msg)
end

function onThink()
	npcHandler:onThink()
end

--	//	--	//	--	//	--
local skull_id = 11073	-- SKULL ID, MISSION 2 <edit me please>
local reward = 11111		-- TRIBAL CHEST ID!!! <edit me please>
--	//	--	//	--	//	--
local quest_storage = 17935

local function set(cid, val)
	doPlayerSetStorageValue(cid, quest_storage, val)
end

local function get(cid)
	return getPlayerStorageValue(cid, quest_storage)
end
--	//	--	//	--	//	--

local turn = {}

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local pid = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	if msgcontains(msg, 'help') then
		selfSay("You mean you want help us?", cid)
		turn[pid] = 1
	elseif msgcontains(msg, 'mission') then
		if (get(cid) == 1) then
			selfSay('Big problem we have! Skull of first leader gone. He ancestor of whole tribe but died long ago in war. We have keep his skull on our sacred place. ...', cid)
			local function talk_and_set(cid, pid)
				selfSay('Then one night, green men came with wolves... and one of wolves took skull and ran off chewing on it! We need back - many wisdom and power is in skull. Maybe they took to north fortress. But can be hard getting in. You try get our holy skull back?', cid)
				turn[pid] = 2
			end
			addEvent(talk_and_set, 3500, cid, pid)
		elseif (get(cid) == 3) then
			selfSay('Oh! You found holy skull? In bone pile you found?! Thank Pandor you brought! Me can have it back?', cid)
			turn[pid] = 3
		elseif (get(cid) == 4) then
			local function talk_and_set(cid, pid)
				selfSay('What holy skull sees, tribe sees. That we believe. Can you bring holy skull over big water and show places?', cid)
				turn[pid] = 4
			end
			selfSay('You brought back skull of first leader. Hero of tribe! But we more missions to do. ...', cid)
			addEvent(selfSay, 3500, 'Me and Ulala talk about land outside. We wanting to see more of land! Land over big water! But us no can leave tribe. No can cross water. Only way is skull of first leader. ...', cid)
			addEvent(talk_and_set, 7000, cid, pid)
		elseif (get(cid) == 6) then
			selfSay('You say you was to where sun is hot and burning? And where trees grow as high as mountain? And where Fasuon cries white tears? Me can\'t wait to see!! Can have holy skull back?', cid)
			turn[pid] = 5
		elseif (get(cid) == 7) then
			selfSay('We been weak for too long! We prepare for great hunt. But still need many doings! You can help us?', cid)
			turn[pid] = 6
		elseif (get(cid) == 17) then
			local function talk_and_set(cid, pid)
				selfSay('Now brown water is gone and we sad! Can you bring POT of brown water for party after great hunt? Just bring to me and me trade for shiny treasure.', cid)
				set(cid, 18)	-- beer mission
			end
			selfSay('You well did! Great hunt is under best signs now. We prepare weapons and paint faces and then go! ...', cid)
			addEvent(selfSay, 4000, 'No no, you no need to help us. But can prepare afterparty! Little men sent us stuff some time ago. Was strange water in there. Brown and stinky! But when we tried all tribe became veeeeeeery happy. ...', cid)
			addEvent(talk_and_set, 8000, cid, pid)
		elseif (get(cid) == 18) then
			selfSay('You bring us big pot of strange water from little men?', cid)
			turn[pid] = 7
		end		
	elseif msgcontains(msg, 'yes') then
		if (turn[pid] == 1) then
			selfSay("Me have many small task, but also big mission. You say what want.", cid)
			set(cid, 1)	-- joined
		elseif (turn[pid] == 2) then
			selfSay("You hero of our tribe if bring back holy skull!", cid)
			set(cid, 2)	-- skull mission
		elseif (turn[pid] == 3) then
			selfSay("Me thank you much! All wisdom safe again now.", cid)
			doPlayerRemoveItem(cid, skull_id, 1)
			set(cid, 4)	-- new mission
		elseif (turn[pid] == 4) then
			selfSay("Here take holy skull. You bring where you think is good. See as much as possible! See where other people live!", cid)
			local skull = doCreateItemEx(skull_id, 1)
			doItemSetAttribute(skull, "aid", 24151)
			doPlayerAddItemEx(cid, skull)
			set(cid, 5)	-- watching the world
		elseif (turn[pid] == 5) then
			if doPlayerRemoveItem(cid, skull_id, 1) then
				selfSay("We make big ritual soon and learn much about world outside. Me thank you many times for teaching us world. Very wise and adventurous you are!", cid)
				set(cid, 7)	-- available for new mission
			else
				selfSay("What?? where is the skull?", cid)
			end
		elseif (turn[pid] == 6) then
			selfSay("We need to calm and make happy gods. Best go to Ulala. She is priest of us and can tell what needs doing.", cid)
			set(cid, 8)	-- ulala part
		elseif (turn[pid] == 7) then
			local beer = getPlayerItemById(cid, true, 2562, 3).uid
			if (beer > 0) then
				selfSay("Me thank you much! Party will be great again! Here you have old treasure of tribe for trade. Found in caves. Me hope you can use one day.", cid)
				doRemoveItem(beer)
				doPlayerAddItem(cid, reward, 1)
				set(cid, 19)	-- DONE!!!
			else
				selfSay("Please bring the brown water.", cid)
			end			
		end
		turn[pid] = 0
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 