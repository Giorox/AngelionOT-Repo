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
	if storage == 2 then
		npcHandler:say("Ohh, my Family necklace, thank you very much adventurer! Here take {elvenhair rope} as a reward.", cid)
		setPlayerStorageValue(cid, 42329, 3)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
		local item3 = doPlayerAddItem(cid, 7731, 1)
		doPlayerRemoveItem(cid, 8584, 1)
	else
		npcHandler:say("Ask Chief Grarkharok first.", cid)
	end
	end
return TRUE
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
