local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
if(msgcontains(msg, 'quest')) then
selfSay('I need to get my hands on some creature products, would you help?', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'mission')) and getPlayerStorageValue(cid, 72372) == -1 then
npcHandler:say({'Oh I am in need of {5 orc tooth}, {5 lizard leather} and {5 minotaur leather}, please bring me these products as fast as possible and Ill reward you somehow. ...', 'Would you help me out, please?'}, cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
selfSay('Thank you, please hurry up and get me them!', cid)
setPlayerStorageValue(cid, 72372, 1)
else
if(doPlayerRemoveItem(cid, 11109, 5) == TRUE) and doPlayerRemoveItem(cid, 5876, 5) == TRUE and doPlayerRemoveItem(cid, 5878, 5) == TRUE then
doPlayerAddItem(cid, 11111, 1)
doPlayerAddExperience(cid,10000)
setPlayerStorageValue(cid, 72372, 2)
selfSay('Thank you for bringing me the products, here take this crest to show that you have proven yourself a worthy dryad.)', cid)
else
selfSay('You don\'t have the neccessary items', cid)
end
return true
end

end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  