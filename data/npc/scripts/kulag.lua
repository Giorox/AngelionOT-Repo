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
local storage = getPlayerStorageValue(cid, 1889)

if msgcontains(msg, 'trouble') then
	if storage == 6 then
		npcHandler:say("You adventurers become more and more of a pest.", cid)
		setPlayerStorageValue(cid, 1889, 7)
	else
		npcHandler:say("I don't feel like chatting.", cid)
	end
elseif msgcontains(msg, 'authorities') then	
	if storage == 7 then
		npcHandler:say("They should throw you all into jail instead of giving you all those quests and rewards an honest watchman can only dream about.", cid)
		setPlayerStorageValue(cid, 1889, 8)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
	else
		npcHandler:say("I don't feel like chatting.", cid)
	end
end

return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
