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
	if storage == 12 then
		npcHandler:say("I'm fine. There's no trouble at all.", cid)
		setPlayerStorageValue(cid, 1889, 13)
	else
		npcHandler:say("I don't feel like chatting.", cid)
	end
elseif msgcontains(msg, 'foresight of authorities') then	
	if storage == 13 then
		npcHandler:say("Well, of course. We live in safety and peace.", cid)
		setPlayerStorageValue(cid, 1889, 14)
	else
		npcHandler:say("I don't feel like chatting.", cid)
	end
elseif msgcontains(msg, 'also for the gods') then	
	if storage == 14 then
		npcHandler:say("I think the gods are looking after us and their hands shield us from evil.", cid)
		setPlayerStorageValue(cid, 1889, 15)
	elseif storage ~= 14 then 
		npcHandler:say("I don't feel like chatting.", cid)
	end
elseif msgcontains(msg, 'what abount in the near future') then	
	if storage == 15 then
		npcHandler:say("I think the gods and the government do their best to keep away harm from the citizens.", cid)
		setPlayerStorageValue(cid, 1889, 16)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
	elseif storage ~= 15 then 
		npcHandler:say("I don't feel like chatting.", cid)
	end	
end

return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
