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
	if storage == 16 then
		npcHandler:say("I think it'll rain soon and I left some laundry out for drying.", cid)
		setPlayerStorageValue(cid, 1889, 17)
	else
		npcHandler:say("I don't feel like chatting.", cid)
	end
elseif msgcontains(msg, 'authorities') then	
	if storage == 17 then
		npcHandler:say("Yes I'm pretty sure they have failed to send the laundry police to take care of it, you fool.", cid)
		setPlayerStorageValue(cid, 1889, 18)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
	else
		npcHandler:say("I don't feel like chatting.", cid)
	end
end
return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
