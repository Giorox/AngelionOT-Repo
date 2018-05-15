local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

function creatureSayCallback(cid, type, msg)
     if not npcHandler:isFocused(cid) then
         return false
     end

     local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	 
     if msgcontains(msg, "mission") and getPlayerStorageValue(cid, 23000) == -1 then
         selfSay("Very good, we need heroes like you to go on a suici...er...to earn respect of the authorities here AND in addition get a great reward for it. Are you interested in the job?", cid)
         talkState[talkUser] = 1
	 elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
         selfSay("Very well, maybe you know that the orcs here in Edron learnt to raise giant spiders. It is going to become a serious threat...", cid)
		 selfSay("The mission is simple: go to the orcs and destroy all spider eggs that are hatched by the giant spider they have managed to catch. The orcs are located in the south of the western part of the island.", cid)
         talkState[talkUser] = 0
		 setPlayerStorageValue(cid, 23000, 1)
	 end
  
     if msgcontains(msg, "mission") and getPlayerStorageValue (cid, 23000) <= 4 then
        selfSay("My sources say that you have not yet done it.", cid)
	 elseif msgcontains(msg, "mission") and getPlayerStorageValue (cid, 23000) >= 5 then
			selfSay("What? YOU DID IT?!?! That is....that is.....er....<drops a piece of paper. You see the headline DEATH CERTIFICATE> like I expected!! Here is your reward.", cid)
			setPlayerStorageValue(cid, 23000, 15)
			doPlayerAddItem(cid, 7887, 1)
			talkState[talkUser] = 0
	 end
	 return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

