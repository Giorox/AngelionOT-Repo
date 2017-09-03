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
	if storage == 8 then
		npcHandler:say("Ah, well. Just this morning my new toothbrush fell into the toilet.", cid)
		setPlayerStorageValue(cid, 1889, 9)
	else
		npcHandler:say("I don't feel like chatting.", cid)
	end
elseif msgcontains(msg, 'authorities') then	
	if storage == 9 then
		npcHandler:say("What do you mean? Of course they will immediately send someone with extra long and thin arms to retrieve it!", cid)
		setPlayerStorageValue(cid, 1889, 10)
	else
		npcHandler:say("I don't feel like chatting.", cid)
	end
elseif msgcontains(msg, 'avoided') then	
	if storage == 10 then
		npcHandler:say("Your humour might let end you up beaten in some dark alley, you know? No, I don't think someone could have prevented that accident!", cid)
		setPlayerStorageValue(cid, 1889, 11)
	else
		npcHandler:say("I don't feel like chatting.", cid)
	end
elseif msgcontains(msg, 'gods allow') then	
	if storage == 11 then
		npcHandler:say("It's not a drama!! I think there is just no god who's responsible for toothbrush safety, that's all ...", cid)
		setPlayerStorageValue(cid, 1889, 12)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
	else
		npcHandler:say("I don't feel like chatting.", cid)
	end	
end
return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
