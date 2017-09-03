local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --

oassassin    = 22025
fassassin    = 22026
sassassin    = 22027   


newaddon    = 'Ah, right! The assassin headpiece! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function AssassinFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
        if getPlayerStorageValue(cid,fassassin) == -1 then	
        if getPlayerItemCount(cid,5909) >= 50 and getPlayerItemCount(cid,5910) >= 50 and getPlayerItemCount(cid,5911) >= 50 and getPlayerItemCount(cid,5912) >= 50 and getPlayerItemCount(cid,5913) >= 50 and getPlayerItemCount(cid,5914) >= 50 and getPlayerItemCount(cid,5886) >= 10 then
        if doPlayerRemoveItem(cid,5909,50) and doPlayerRemoveItem(cid,5910,50) and doPlayerRemoveItem(cid,5911,50) and doPlayerRemoveItem(cid,5912,50) and doPlayerRemoveItem(cid,5913,50) and doPlayerRemoveItem(cid,5914,50) and doPlayerRemoveItem(cid,5886,10) then
            npcHandler:say('Ah, right! The assassin headpiece! Here you go.')
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,fassassin,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 152, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 156, 1)
            
        end
		end
        else
            selfSay(noitems2)
        end
    else
        selfSay(already)
    end
    end

end



node1 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get assassin headpiece you need give me 50 blue piece of cloth, 50 green piece of cloth, 50 red piece of cloth, 50 brown piece of cloth, 50 yellow piece of cloth, 50 white piece of cloth and 10 spider silk yarns. Do you have them with you?'})
node1:addChildKeyword({'yes'}, AssassinFirst, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})



npcHandler:addModule(FocusModule:new())