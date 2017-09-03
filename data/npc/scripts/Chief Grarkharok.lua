local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end
function creatureSayCallback(cid, type, msg)
        if(not npcHandler:isFocused(cid)) then
                return false
        end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
local storage = getPlayerStorageValue(cid, 42329)

if msgcontains(msg, 'mission') then
	if storage == 0 then
		npcHandler:say("Hrhrhrhr! Me no fear of human! Me Chief Grarkharok!!", cid)
		setPlayerStorageValue(cid, 42329, 1)
	else
		npcHandler:say("Hrhrhrhr!", cid)
	end
elseif msgcontains(msg, 'elvenhair rope') then	
	if storage == 1 then
		npcHandler:say("Hrhrhr, take Jerom's family necklace and give it him back Hrhrhr.", cid)
		setPlayerStorageValue(cid, 42329, 2)
		local item3 = doPlayerAddItem(cid, 8584, 1)
	else
		npcHandler:say("Give Jerom's his family necklace and you will get your reward Hrhrhr", cid)
	end
end

return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
