local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --

fmage        = 22005    
smage        = 22006
  
ssummoner    = 22621   

newaddon    = 'Ah, right! The barbarian axe! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'

function SummonerSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,ssummoner)
    if addon == -1 then
       if getPlayerItemCount(cid,5894) >= 70 and getPlayerItemCount(cid,5911) >= 20 and getPlayerItemCount(cid,5883) >= 40 and getPlayerItemCount(cid,5922) >= 35 and getPlayerItemCount(cid,5886) >= 10 and getPlayerItemCount(cid,5881) >= 60 and getPlayerItemCount(cid,5882) >= 40 and getPlayerItemCount(cid,5904) >= 15 and getPlayerItemCount(cid,5905) >= 30 then
        if doPlayerRemoveItem(cid,5894,70) and doPlayerRemoveItem(cid,5911,20) and doPlayerRemoveItem(cid,5883,40) and doPlayerRemoveItem(cid,5922,35) and doPlayerRemoveItem(cid,5886,10) and doPlayerRemoveItem(cid,5881,60) and doPlayerRemoveItem(cid,5882,40) and doPlayerRemoveItem(cid,5904,15) and doPlayerRemoveItem(cid,5905,30) then
            npcHandler:say('Ah, right! The summoner cloak! Here you go.')
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,ssummoner,1)
			if getPlayerSex(cid) == 1 then
            doPlayerAddOutfit(cid, 133, 2)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 141, 2)	
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

node1 = keywordHandler:addKeyword({'tiara'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get mage tiara you need give me 70 bat wings, 20 red pieces of cloth, 40 ape fur, 35 holy orchid, 10 spools of spider silk yarn, 60 lizard scales, 40 red dragon scales, 15 magic sulphurs and 30 vampire dusts. Do you have them with you?'})
node1:addChildKeyword({'yes'}, SummonerSecond, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'cloak'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get summoner cloak you need give me 70 bat wings, 20 red pieces of cloth, 40 ape fur, 35 holy orchid, 10 spools of spider silk yarn, 60 lizard scales, 40 red dragon scales, 15 magic sulphurs and 30 vampire dusts. Do you have them with you?'})
node2:addChildKeyword({'yes'}, SummonerSecond, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})




npcHandler:addModule(FocusModule:new())