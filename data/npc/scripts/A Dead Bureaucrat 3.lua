local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local t = {}
 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
 
local function f(a)
    if a > 4 then
        a = a - 4
    end
    return a==1 and 'sorcerer' or a==2 and 'druid' or a==3 and 'paladin' or 'knight'
end
 
function free(cid)
    if npcHandler:isFocused(cid) then
        t[cid] = nil
    end
    return true
end
 
function thinkCallback(cid)
    if math.random(400) == 1 then
        npcHandler:say('<sigh>')
    end
    return true
end
 
function greetCallback(cid)
    t[cid] = nil
    if getCreatureStorage(cid, 411) ~= -1 then
        npcHandler:setMessage(MESSAGE_GREET, 'Back again? How can I help you this time?')
    else
        npcHandler:setMessage(MESSAGE_GREET,
        getPlayerSex(cid) == 0 and
            'Hello beautiful lady, welcome to the atrium of Pumin\'s Domain. We require some information from you before we can let you pass. Where do you want to go?'
        or
            'Welcome to the atrium of Pumin\'s domain, young man. We need some information before we can let you pass. Where do you want to go?'
        )
    end
    return true
end
 
function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    elseif not t[cid] then
        if msgcontains(msg, 'pumin') and getCreatureStorage(cid, 411) == -1 then
            npcHandler:say('Tell me if you liked it when you come back. What is your name?', cid)
            t[cid] = 1
        elseif msgcontains(msg, '145') and getCreatureStorage(cid, 411) == 1 and getCreatureStorage(cid, 145) == 0 then
            npcHandler:say('Well done! You have form 411!! Here is Form 145. Have fun with it.', cid)
            doCreatureSetStorage(cid, 145, 1)
        end
    elseif t[cid] == 1 then
        if msg:lower() == getCreatureName(cid):lower() then
            npcHandler:say('Alright '.. getCreatureName(cid) .. '. Vocation?', cid)
            t[cid] = 2
        end
    elseif t[cid] == 2 then
        local s = f(getPlayerVocation(cid))
        if msg:lower() == s then
            -- needs different replies?
            npcHandler:say('I was a ' .. s .. ', too, before I died!! What do you want from me?', cid)
            t[cid] = 3
        end
    elseif t[cid] == 3 then
        if msgcontains(msg, '145') then
            npcHandler:say('That\'s right, you can get Form 145 from me. However, I need Form 411 first. Come back when you have it.', cid)
            doCreatureSetStorage(cid, 411, 0)
            t[cid] = nil
        end
    end
    return true
end
 
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye and don\'t forget me!')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye and don\'t forget me!')
npcHandler:setCallback(CALLBACK_FAREWELL, free)
npcHandler:setCallback(CALLBACK_CREATURE_DISAPPEAR, free)
npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())