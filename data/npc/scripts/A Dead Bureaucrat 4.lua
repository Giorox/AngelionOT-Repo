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
    if getCreatureStorage(cid, 145) ~= -1 then
        npcHandler:setMessage(MESSAGE_GREET, 'Hey! You are back!! How can I help you this time?')
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
        if msgcontains(msg, 'pumin') and getCreatureStorage(cid, 145) == -1 then
            npcHandler:say('I\'m not sure if you know what you are doing but anyway. Your name is?', cid)
            t[cid] = 1
        elseif msgcontains(msg, '356') and getCreatureStorage(cid, 145) == 1 and getCreatureStorage(cid, 356) == 0 then
            npcHandler:say('You are better than I thought! Congratulations, here you are: Form 356!', cid)
            doCreatureSetStorage(cid, 356, 1)
        end
    elseif t[cid] == 1 then
        if msg:lower() == getCreatureName(cid):lower() then
            npcHandler:say('Alright '.. getCreatureName(cid) .. '. Vocation?', cid)
            t[cid] = 2
        end
    elseif t[cid] == 2 then
        local s = f(getPlayerVocation(cid))
        if msg:lower() == s then
            npcHandler:say(s:upper():gsub('%a', '%1 '):gsub('%s$', ',') .. ' is that right?! What do you want from me?', cid)
            t[cid] = 3
        end
    elseif t[cid] == 3 and msgcontains(msg, '356') then
        npcHandler:say('Sorry, you need Form 145 to get Form 356. Come back when you have it.', cid)
        doCreatureSetStorage(cid, 145, 0)
        t[cid] = nil
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