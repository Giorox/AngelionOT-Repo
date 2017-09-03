local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --

fbarbarian    = 22015
sbarbarian    = 22016

newaddon    = 'Ah, right! The barbarian axe! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function BarbarianSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,sbarbarian)
    if addon == -1 then
        if getPlayerItemCount(cid,5884) >= 1 and getPlayerItemCount(cid,5885) >= 1 and getPlayerItemCount(cid,5911) >= 50 and getPlayerItemCount(cid,5910) >= 50 and getPlayerItemCount(cid,5886) >= 10 then
        if doPlayerRemoveItem(cid,5884,1) and doPlayerRemoveItem(cid,5885,1) and doPlayerRemoveItem(cid,5911,50) and doPlayerRemoveItem(cid,5910,50) and doPlayerRemoveItem(cid,5886,10) then
            npcHandler:say('Ah, right! The barbarian wig! Here you go.')
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,sbarbarian,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 143, 2)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 147, 2)
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



node1 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get barbarian wig you need give me a fighting spirit, the warrior\'s sweat, 50 red pieces of cloth, 50 green pieces of cloth and 10 spider silk yarns. Do you have them with you?'})
node1:addChildKeyword({'yes'}, BarbarianSecond, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})



npcHandler:addModule(FocusModule:new())