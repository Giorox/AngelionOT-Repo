local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --

foriental    = 22017
soriental    = 22018 

newaddon    = 'Ah, right! The oriental scimitar or oriental jewelled belt! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function OrientalFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,foriental)
    if addon == -1 then
        if getPlayerItemCount(cid,5945) >= 1 then
        if doPlayerRemoveItem(cid,5945,1) then
            npcHandler:say('Ah, right! The oriental scimitar or oriental jewelled belt! Here you go.')             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,foriental,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 146, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 150, 1)
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



node1 = keywordHandler:addKeyword({'scimitar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get oriental scimitar you need give me a mermaid comb. Do you have it with you?'})
node1:addChildKeyword({'yes'}, OrientalFirst, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get oriental scimitar you need give me a mermaid comb. Do you have it with you?'})
node2:addChildKeyword({'yes'}, OrientalFirst, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})


npcHandler:addModule(FocusModule:new())