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
		if storage == 2 then
				npcHandler:say("I think there is a pickpocket in town.", cid)
				setPlayerStorageValue(cid, 1889, 3)
		else
			npcHandler:say("I don't feel like chatting.", cid)
		end
	elseif msgcontains(msg, 'authorities') then
		if storage == 3 then
			npcHandler:say("Well, sooner or later we will get hold of that delinquent. That's for sure.", cid)
			setPlayerStorageValue(cid, 1889, 4)
		else
			npcHandler:say("I don't feel like chatting.", cid)
		end
	elseif msgcontains(msg, 'avoided') then	
		if storage == 4 then
			npcHandler:say("You can't tell by a person's appearance who is a pickpocket and who isn't. You simply can't close the city gates for everyone.", cid)
			setPlayerStorageValue(cid, 1889, 5)
		else
			npcHandler:say("I don't feel like chatting.", cid)
		end
	elseif msgcontains(msg, 'gods allow') then	
		if storage == 5 then
			npcHandler:say("If the gods had created the world a paradise, no one had to steal at all. ", cid)
			setPlayerStorageValue(cid, 1889, 6)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
		else
			npcHandler:say("I don't feel like chatting.", cid)
		end	
	end
return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
