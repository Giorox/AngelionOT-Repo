local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local Topic = {}
local questLog = 14504

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function greetCallback(cid)
	Topic[cid] = 0
	return true
end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, 'task') then
		if getPlayerStorageValue(cid, 14004) < 0 then
			selfSay({"I am so angry I could spit grit! That damn Horned Fox and his attacks! Let's show those bull-heads that they have messed with the wrong people. ...", "I want you to kill 5000 minotaurs - no matter where - for me and all the dwarfs of Kazordoon! Are you willing to do that?"}, cid)
			Topic[cid] = 1
		elseif getPlayerStorageValue(cid, 14004) == 5000 and getPlayerStorageValue(cid, 14104) < 1 then
			selfSay("By all that is holy! You are a truly great warrior! With much patience! I have just found out the location the hideout of The Horned Fox! I have marked the spot on your map so you can find it. Go there and slay him!! Good luck!", cid)
			setPlayerStorageValue(cid, 14104, 1)
		end
	elseif Topic[cid] == 1 and msgcontains(msg, 'yes') then
		selfSay("Hussah! Let's bring war to those hoof-legged, dirt-necked, bull-headed minotaurs!! Come back to me when you are done with your mission.", cid)
		setPlayerStorageValue(cid, 14004, 0)
		if getPlayerStorageValue(cid, questLog) < 1 then
			setPlayerStorageValue(cid, questLog, 1)
		end
		Topic[cid] = 0
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, 'Hiho, hiho |PLAYERNAME|.')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Bye bye.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Bye bye.')
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())