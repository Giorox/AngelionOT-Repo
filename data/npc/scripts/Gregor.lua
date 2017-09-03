local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --

fknight        = 22007
sknight        = 22008 

newaddon    = 'Ah, right! The knight horned helmet or adorned helmet! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function KnightSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,sknight)
    if addon == -1 then
        if getPlayerItemCount(cid,5893) >= 100 and getPlayerItemCount(cid,5924) >= 1 and getPlayerItemCount(cid,5885) >= 1 and getPlayerItemCount(cid,5887) >= 1 then
        if doPlayerRemoveItem(cid,5893,100) and doPlayerRemoveItem(cid,5924,1) and doPlayerRemoveItem(cid,5885,1) and doPlayerRemoveItem(cid,5887,1) then
            npcHandler:say('Ah, right! The knight horned helmet or adorned helmet! Here you go.')
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,sknight,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 131, 2)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 139, 2)
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

node1 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get knight horned helmet you need give me 100 perfect behemoth fangs, a damaged steel helmet, warrior\'s sweat and a royal steel. Do you have them with you?'})
node1:addChildKeyword({'yes'}, KnightSecond, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})



npcHandler:addModule(FocusModule:new())