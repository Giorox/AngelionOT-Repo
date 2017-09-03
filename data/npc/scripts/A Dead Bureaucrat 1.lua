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
    local s = getCreatureStorage(cid, 356)
    if s == 2 then
        npcHandler:setMessage(MESSAGE_GREET, 'You again. What do you need this time?') --
    elseif s ~= -1 then
        npcHandler:setMessage(MESSAGE_GREET, 'You again. I told my master that you wish to end your stupid life in his domain but you need Form 356 to get there. What do you need this time?')
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
        if msgcontains(msg, 'pumin') and getCreatureStorage(cid, 356) == -1 then
            npcHandler:say('Sure, where else. Everyone likes to meet my master, he is a great demon, isn\'t he? Your name is ...?', cid)
            t[cid] = 1
        elseif msgcontains(msg, '411') and getCreatureStorage(cid, 411) == 0 then
            npcHandler:say('Form 411? You need Form 287 to get that! Do you have it?', cid)
            t[cid] = 4
        elseif msgcontains(msg, '356') and getCreatureStorage(cid, 356) == 1 then
            npcHandler:say('INCREDIBLE, you did it!! Have fun at Pumin\'s Domain!', cid)
            doCreatureSetStorage(cid, 356, 2)
        end
    elseif t[cid] == 1 then
        if msg:lower() == getCreatureName(cid):lower() then
            npcHandler:say('Alright '.. getCreatureName(cid) .. '. Vocation?', cid)
            t[cid] = 2
        end
    elseif t[cid] == 2 then
        if msg:lower() == f(getPlayerVocation(cid)) then
            -- needs different replies
            npcHandler:say('Huhu, please don\'t hurt me with your wand! Reason of your visit?', cid)
            t[cid] = 3
        end
    elseif t[cid] == 3 then
        if msgcontains(msg, 'visit') and msgcontains(msg, 'pumin') then
            npcHandler:say('How very interesting. I need to tell that to my master immediately. Please go to my colleagues and ask for Form 356. You will need it in order to proceed.', cid)
            doCreatureSetStorage(cid, 356, 0)
            t[cid] = nil
        end
    elseif t[cid] == 4 then
        local s = getCreatureStorage(cid, 287)
        if msgcontains(msg, 'yes') and s == 1 then
            npcHandler:say('Great. Here you are. Form 411. Come back anytime you want to talk. Bye.', cid)
            doCreatureSetStorage(cid, 411, 1)
        else
            npcHandler:say('Oh, what a pity. Go see one of my colleagues. I give you the permission to get Form 287. Bye!', cid)
            if s == -1 then
                doCreatureSetStorage(cid, 287, 0)
            end
        end
        npcHandler:releaseFocus(cid)
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