local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
 
function thinkCallback(cid)
    if math.random(400) == 1 then
        npcHandler:say('<sigh>')
    end
    return true
end
 
function greetCallback(cid)
    npcHandler:setMessage(MESSAGE_GREET,
    getPlayerSex(cid) == 0 and
        'Hello beautiful lady, welcome to the atrium of Pumin\'s Domain. What do you need?'
    or
        'Welcome to the atrium of Pumin\'s domain, young man. What do you need?'
    )
    return true
end
 
function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    elseif msgcontains(msg, '287') and getCreatureStorage(cid, 287) == 0 then
        npcHandler:say('Sure, you can get it from me. Here you are. Bye!', cid)
        doCreatureSetStorage(cid, 287, 1)
        npcHandler:releaseFocus(cid)
    end
    return true
end
 
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye and don\'t forget me!')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye and don\'t forget me!')
npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())