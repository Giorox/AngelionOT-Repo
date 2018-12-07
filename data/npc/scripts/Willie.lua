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
	local StuddedQuestStorage = 64113

	if getPlayerStorageValue(cid, StuddedQuestStorage) == -1 then
		if msgcontains(msg, 'banana') then
            npcHandler:say("Have you found a banana for me?", cid)
            talkState[talkUser] = 1
        elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then  
            npcHandler:say("A banana! Great. Here, take this shield, I don't need it anyway.", cid)
			doPlayerRemoveItem(cid,2676,1)
			doPlayerAddItem(cid,2526,1)
			setPlayerStorageValue(cid, StuddedQuestStorage, 1)
            talkState[talkUser] = 0
		end
	else
		npcHandler:say("You already gave me a banana.", cid)
	end

end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())