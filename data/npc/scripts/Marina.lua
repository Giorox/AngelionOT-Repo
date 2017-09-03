local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local Topic = {}
local storage = 8647

function onCreatureAppear(cid)        npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg) end
function onThink()             npcHandler:onThink() end

function greetCallback(cid)
  local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  Topic[talkUser] = 0
    return true
end

function creatureSayCallback(cid, type, msg)

  if(not npcHandler:isFocused(cid)) then
    return false
  end

  local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  if msgcontains(msg, "silk yarn") and getPlayerStorageValue(cid, storage) == 3 then
    npcHandler:say("Okay... a deal is a deal, would you like me to create a spool of yarn from 10 pieces of spider silk?", cid)
    Topic[talkUser] = 4
	elseif msgcontains(msg, "yes") and Topic[talkUser] == 4 and getPlayerStorageValue(cid, storage) == 3 and getPlayerItemCount(cid, 5879) >= 10 then
    npcHandler:say("Ew... gooey... there you go.", cid)
	doPlayerRemoveItem(cid, 5879, 10)
	doPlayerAddItem(cid,5886,1)
    Topic[talkUser] = 0
  elseif msgcontains(msg, "silk yarn") and getPlayerStorageValue(cid, storage) < 1 then
    npcHandler:say("Um. You mean, you really want me to touch that gooey spider silk just because you need yarn? Well... do you think that I'm pretty?", cid)
    Topic[talkUser] = 1
  elseif msgcontains(msg, "yes") and Topic[talkUser] == 1 and getPlayerStorageValue(cid, storage) < 1 then
    npcHandler:say({"Well, everyone would say that in your position. Do you think that I'm really, absolutely the most stunning being that you have ever seen?"}, cid)
    Topic[talkUser] = 2
  elseif msgcontains(msg, "yes") and Topic[talkUser] == 2 and getPlayerStorageValue(cid, storage) < 1 then
    npcHandler:say({"<giggles> It's funny how easy it is to get humans to say what you want. Now, proving it will be even more fun! ...", "You want me to touch something gooey, so you have to touch something gooey for me too. <giggles> ...", "I love honey and I haven't eaten it in a while, so bring me 50 honeycombs and worship my beauty a little more, then we will see."}, cid)
    Topic[talkUser] = 0
	setPlayerStorageValue(cid, storage, 2)
	elseif msgcontains(msg, "50 honeycombs") and getPlayerStorageValue(cid, storage) == 2 then
    npcHandler:say({"Did you bring me the 50 honeycombs I requested and do you absolutely admire my beauty?"}, cid)
    Topic[talkUser] = 3
	elseif msgcontains(msg, "yes") and Topic[talkUser] == 3 and getPlayerStorageValue(cid, storage) == 2 and getPlayerItemCount(cid, 5902) >= 50 then
    npcHandler:say({"Oh goodie! Thank you! Okay... I guess since my fingers are sticky now anyway, I will help you. From now on, if you bring me 10 pieces of spider silk, I will create one spool of yarn."}, cid)
    doPlayerRemoveItem(cid, 5902, 50)
	Topic[talkUser] = 0
	setPlayerStorageValue(cid, storage, 3)
  end
  return TRUE
end

npcHandler:setMessage(MESSAGE_GREET, "Greetingz, competitor.")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
