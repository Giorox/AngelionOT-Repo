local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --

sopirate       = 22031
opirate        = 22032
fpirate        = 22033
spirate        = 22034

newaddon    = 'Ah, right! The pirate hat! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function PirateSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    if getPlayerStorageValue(cid,spirate) == -1 then
        if getPlayerItemCount(cid,6101) >= 1 and getPlayerItemCount(cid,6102) >= 1 and getPlayerItemCount(cid,6100) >= 1 and getPlayerItemCount(cid,6099) >= 1 then
        if doPlayerRemoveItem(cid,6101,1) and doPlayerRemoveItem(cid,6102,1) and doPlayerRemoveItem(cid,6100,1) and doPlayerRemoveItem(cid,6099,1) then
            npcHandler:say('Ah, right! The pirate hat! Here you go.')             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,spirate,1)
			if getPlayerSex(cid) == 1 then
            doPlayerAddOutfit(cid, 151, 2)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 155, 2)
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



node1 = keywordHandler:addKeyword({'hat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get pirate hat you need give me brutus bloodbeard\'s hat, lethal lissy\'s shirt, ron the ripper\'s sabre and deadeye devious\' eye patch. Do you have them with you?'})
node1:addChildKeyword({'yes'}, PirateSecond, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get pirate hat you need give me brutus bloodbeard\'s hat, lethal lissy\'s shirt, ron the ripper\'s sabre and deadeye devious\' eye patch. Do you have them with you?'})
node2:addChildKeyword({'yes'}, PirateSecond, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})



npcHandler:addModule(FocusModule:new())