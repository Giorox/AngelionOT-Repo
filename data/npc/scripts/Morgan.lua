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
fwarrior        = 22038
swarrior        = 22039

newaddon    = 'Ah, right! The knight sword! Here you go.'
newaddon1    = 'Ah, right! The warrior sword! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'

function WarriorSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,swarrior)
    if addon == -1 then
            if getPlayerItemCount(cid,5887) >= 1 and getPlayerItemCount(cid,5880) >= 100 then
            if doPlayerRemoveItem(cid,5887,1) and doPlayerRemoveItem(cid,5880,100) then
		    npcHandler:say('Ah, right! The warrior sword! Here you go.')             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,swarrior,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 134, 2)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 142, 2)
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


function KnightFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,fknight)
    if addon == -1 then
        if getPlayerItemCount(cid,5892) >= 1 and getPlayerItemCount(cid,5880) >= 100 then
        if doPlayerRemoveItem(cid,5892,1) and doPlayerRemoveItem(cid,5880,100) then
            npcHandler:say('Ah, right! The knight sword! Here you go.')
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,fknight,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 131, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 139, 1)
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

node1 = keywordHandler:addKeyword({'sword'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get knight sword you need give me a chunk of crude iron and 100 iron ores. Do you have it with you?'})
node1:addChildKeyword({'yes'}, KnightFirst, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'knight'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get knight sword you need give me a chunk of crude iron and 100 iron ores. Do you have it with you?'})
node2:addChildKeyword({'yes'}, KnightFirst, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node3 = keywordHandler:addKeyword({'warrior'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get warrior sword you need give me 100 iron ores and a piece of royal steel. Do you have them with you?'})
node3:addChildKeyword({'yes'}, WarriorSecond, {})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node4 = keywordHandler:addKeyword({'warrior addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get warrior sword you need give me 100 iron ores and a piece of royal steel. Do you have them with you?'})
node4:addChildKeyword({'yes'}, WarriorSecond, {})
node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})


npcHandler:addModule(FocusModule:new())