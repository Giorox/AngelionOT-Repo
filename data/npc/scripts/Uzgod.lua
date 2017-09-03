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
	local storage = 98238
	if(msgcontains(msg, 'piece of draconian steel') or msgcontains(msg, 'obsidian knife')) then
		if(getPlayerStorageValue(cid, storage) < 1) then
			npcHandler:say("You bringing me draconian steel and obsidian lance in exchange for obsidian knife?", cid)
			setPlayerStorageValue(cid, storage, 1)
		elseif(getPlayerStorageValue(cid, storage) == 1) then
			npcHandler:say("Did you bring me the draconian steel and obsidian lance in exchange for obsidian knife?", cid)
			talkState[talkUser] = 1
		elseif(getPlayerStorageValue(cid, storage) == 2) then
			npcHandler:say("Sorry no more trade with you.", cid)
		end
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
  		if doPlayerRemoveItem(cid,2425,1) and doPlayerRemoveItem(cid,5889,1) and getPlayerStorageValue(cid, storage) == 1 then
			npcHandler:say("Here you have it.", cid)
			doPlayerAddItem(cid, 5908, 1)
			setPlayerStorageValue(cid, storage, 2)
			talkState[talkUser] = 0
		else
			npcHandler:say("You don't have the neccesary items.", cid)
			talkState[talkUser] = 0
		end
	elseif(msgcontains(msg, 'no') and talkState[talkUser] > 0) then
		npcHandler:say("Then not.", cid)
		talkState[talkUser] = 0
	end
	return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
