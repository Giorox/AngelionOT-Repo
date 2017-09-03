local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end
function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	--[[
	REMEMBER TO SET YOUR STORAGE AS YOURSTORAGE!
	]]--
	local storage = 123458
	local itemid = 8710
	if(msgcontains(msg, 'quest') or msgcontains(msg, 'favor')) then
		if(getPlayerStorageValue(cid, storage) < 1) then
			npcHandler:say("Hey, I have a slight favor to ask... Seymour has asked me to get him 10 cockroach legs but quite honestly, those things disgust me. So I need you to do it for me.", cid)
			setPlayerStorageValue(cid, storage, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Quest Completed: Welcome to Real Tibia.")
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "New Quest: Seymour\'s Favor")
		elseif(getPlayerStorageValue(cid, storage) == 1) then
			npcHandler:say("Do you have the 10 cockroach legs??", cid)
			talkState[talkUser] = 1
		elseif(getPlayerStorageValue(cid, storage) == 2) then
			npcHandler:say("What are you doing? You\'ve finished the favor.", cid)
		end
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		if doPlayerRemoveItem(cid, itemid, 10) == TRUE then
			npcHandler:say("Thanks, sometimes I think I\'m too lazy but who gives a damn. Anyway, here is your reward! By the way, you might wanna go north outside the city for more dangerous monsters and quests..", cid)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Quest Completed: Seymour\'s Favor")
			doPlayerAddExp(cid, 250)
			doPlayerAddItem(cid, 2152, 1)
			setPlayerStorageValue(cid, storage, 2)
			talkState[talkUser] = 0
		else
			npcHandler:say("It seems you don\'t have enough legs gathered.", cid)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, 'no') and talkState[talkUser] > 0) then
		npcHandler:say("Oh well then.", cid)
		talkState[talkUser] = 0
	end
	return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

