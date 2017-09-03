local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end

-- Storage IDs --

fhunter        = 22003 
shunter        = 22004 

newaddon    = 'Ah, right! The hooded cloak or winged tiara! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function HunterFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,fhunter)
    if addon == -1 then
        if getPlayerItemCount(cid,5947) >= 1 and getPlayerItemCount(cid,5876) >= 100 and getPlayerItemCount(cid,5948) >= 100 and getPlayerItemCount(cid,5891) >= 5 and getPlayerItemCount(cid,5887) >= 1 and getPlayerItemCount(cid,5888) >= 1 and getPlayerItemCount(cid,5889) >= 1 then
        if doPlayerRemoveItem(cid,5947,1) and doPlayerRemoveItem(cid,5876,100) and doPlayerRemoveItem(cid,5948,100) and doPlayerRemoveItem(cid,5891,5) and doPlayerRemoveItem(cid,5887,1) and doPlayerRemoveItem(cid,5888,1) and doPlayerRemoveItem(cid,5889,1) then
            npcHandler:say('Ah, right! The hooded cloak or winged tiara! Here you go.')
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,fhunter,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 129, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 137, 2)
        end    
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end

function HunterSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,shunter)
    if addon == -1 then
        if getPlayerItemCount(cid,5875) >= 1 then
        if doPlayerRemoveItem(cid,5875,1) then
            npcHandler:say('Ah, right! The sniper gloves! Here you go.')
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,shunter,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 129, 2)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 137, 1)
        end    
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end


node1 = keywordHandler:addKeyword({'hooded cloak'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get hooded cloak you need give me an engraved crossbow, 100 lizard leathers, 100 red dragon leather, 5 enchanted chicken wings, royal steel, hell steel and draconian steel. Do you have them with you?'})
node1:addChildKeyword({'yes'}, HunterFirst, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get winged tiara you need give me an engraved crossbow, 100 lizard leathers, 100 red dragon leather, 5 enchanted chicken wings, royal steel, hell steel and draconian steel. Do you have them with you?'})
node2:addChildKeyword({'yes'}, HunterFirst, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node3 = keywordHandler:addKeyword({'sniper gloves'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get sniper gloves you need give me a pair of sniper gloves. Do you have them with you?'})
node3:addChildKeyword({'yes'}, HunterSecond, {})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node4 = keywordHandler:addKeyword({'second'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get sniper gloves you need give me a pair of sniper gloves. Do you have them with you?'})
node4:addChildKeyword({'yes'}, HunterSecond, {})
node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())