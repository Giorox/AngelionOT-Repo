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


function BarbarianFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,fbarbarian)
    if addon == -1 then
        if getPlayerItemCount(cid,5880) >= 100 and getPlayerItemCount(cid,5892) >= 1 and getPlayerItemCount(cid,5893) >= 50 and getPlayerItemCount(cid,5876) >= 50 and getPlayerStorageValue(cid,barbarian) then
        if doPlayerRemoveItem(cid,5880,100) and doPlayerRemoveItem(cid,5892,1) and doPlayerRemoveItem(cid,5893,50) and doPlayerRemoveItem(cid,5876,50) then
            npcHandler:say('Ah, right! The barbarian axe! Here you go.')
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,fbarbarian,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 143, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 147, 1)
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



node1 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get barbarian axe you need give me 100 iron ore, a chunk of crude iron, 50 behemoth fangs and 50 lizard leathers. Do you have them with you?'})
node1:addChildKeyword({'yes'}, BarbarianFirst, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})



npcHandler:addModule(FocusModule:new())