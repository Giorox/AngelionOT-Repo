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
	 
     if msgcontains(msg, "mission") and getPlayerStorageValue(cid, 8300) == -1 then
         selfSay("", cid)
		 selfSay("", cid)
		 selfSay("", cid)
         talkState[talkUser] = 1
	 elseif msgcontains(msg, "concealed") and talkState[talkUser] == 1 then
         selfSay("I cannot... tell you. I died... long ago... But I still remember my {duties}", cid)
         talkState[talkUser] = 2
	 elseif msgcontains(msg, "duties") and talkState[talkUser] == 2 then
         selfSay("My duties are the only thing death had left me. I have no remembrance of my mortal days... perhaps with one {exception}", cid)
         talkState[talkUser] = 3
	 elseif msgcontains(msg, "exception") and talkState[talkUser] == 3 then
         selfSay("I remember there used to be something I liked. {Grapes}! Delicious juicy grapes! What a joy it is to even remember.", cid)
         talkState[talkUser] = 0
		 setPlayerStorageValue(cid, 8300, 1)
	 end
	 
	 return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())