local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --

onorseman    = 22022
fnorseman    = 22023
snorseman    = 22024 

newaddon    = 'Ah, right! The barbarian axe! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function NorsemanFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    if getPlayerStorageValue(cid,fnorseman) == -1 then
        if getPlayerItemCount(cid,7290) >= 5 then
        if doPlayerRemoveItem(cid,7290,5) then
            npcHandler:say('Excellent, you collected 5 frostheart shards. Take this. It might suit your Nordic outfit fine.')
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,fnorseman,1)
			if getPlayerSex(cid) == 1 then
            doPlayerAddOutfit(cid, 251, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 252, 1)
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

function NorsemanSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    if getPlayerStorageValue(cid,snorseman) == -1 then
        if getPlayerItemCount(cid,7290) >= 10 then
        if doPlayerRemoveItem(cid,7290,10) then
            npcHandler:say('Excellent, you collected 15 frostheart shards. Take this. It might suit your Nordic outfit fine. From now on we only can give you 2000 gold pieces for each shard.')
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,snorseman,1)
			if getPlayerSex(cid) == 1 then
            doPlayerAddOutfit(cid, 251, 2)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 252, 2)            
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




node2 = keywordHandler:addKeyword({'spear'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get norseman spear you need give me 5 shards. Do you have them with you?'})
node2:addChildKeyword({'yes'}, NorsemanFirst, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node1 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get norseman spear you need give me 5 shards. Do you have them with you?'})
node1:addChildKeyword({'yes'}, NorsemanFirst, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'hood'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get norseman hood or norseman earmuffs you need give me 10 shards. Do you have them with you?'})
node2:addChildKeyword({'yes'}, NorsemanSecond, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node3 = keywordHandler:addKeyword({'earmuffs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get norseman hood or norseman earmuffs you need give me 10 shards. Do you have them with you?'})
node3:addChildKeyword({'yes'}, NorsemanSecond, {})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node5 = keywordHandler:addKeyword({'second'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get norseman hood or norseman earmuffs you need give me 10 shards. Do you have them with you?'})
node5:addChildKeyword({'yes'}, NorsemanSecond, {})
node5:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})



npcHandler:addModule(FocusModule:new())