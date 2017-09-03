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
	 
     if msgcontains(msg, "failed") and getPlayerStorageValue(cid, 8300) == -1 then
         selfSay("The pits. We have sealed the pits. We have {concealed} the way.", cid)
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
  
     if msgcontains(msg, "grapes") and getPlayerStorageValue (cid, 8300) == 1 then
        selfSay("You would not have some grapes for me, would you?", cid)
		talkState[talkUser] = 1
	 elseif talkState[talkUser] == 1 and msgcontains(msg, "yes") and getPlayerItemCount(cid, 2681) >= 1 then
			selfSay("Oh, thank you! Thank you! Why, to know such delight! It is almost as if I could taste them again ... almost ...", cid)
			doPlayerRemoveItem(cid, 2681, 1)
			selfSay("Listen, mortal. There is so much I forgot, but I remember that the passage is hidden. It can only be revealed through luck or careful exploration ... ", cid)
			selfSay("One of you must stay here and watch while the others explore every spot of the caverns ahead ... ", cid)
			selfSay("There are so many ... hidden switches. I can't remember where. But ... they will open the path. ", cid)
			setPlayerStorageValue(cid, 8300, 2)
			talkState[talkUser] = 0
	 elseif talkState[talkUser] == 1 and msgcontains(msg, "yes") and getPlayerItemCount(cid, 2681) == 0 then
			selfSay("No, you don't have any with you. That is a shame... ", cid)
			talkState[talkUser] = 0
	 elseif talkState[talkUser] == 1 and msgcontains(msg, "no") then
			selfSay("It does not matter. It is only a faint memory anyway.", cid)
			talkState[talkUser] = 0
	 end
	 return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

