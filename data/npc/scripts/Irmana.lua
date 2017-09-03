local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --

fnobleman    = 22009  
snobleman    = 22010 

newaddon    = 'Ah, right! The nobleman addon! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'

-- NOBLEMAN START --
function NoblemanFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end
    
    local player_gold     = getPlayerItemCount(cid,2148)
    local player_plat     = getPlayerItemCount(cid,2152)*100
    local player_crys     = getPlayerItemCount(cid,2160)*10000
    local player_money     = player_gold + player_plat + player_crys

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,fnobleman)
    if addon == -1 then
        if player_money >= 150000 then
        if doPlayerRemoveMoney(cid,150000) then
            npcHandler:say('Ah, right! The nobleman addon! Here you go.')
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,fnobleman,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 132, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 140, 1)
        end    
        end
        else
            npcHandler:say(noitems)
        end
    else
        npcHandler:say(already)
    end
    end

end

function NoblemanSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end
    
    local player_gold     = getPlayerItemCount(cid,2148)
    local player_plat     = getPlayerItemCount(cid,2152)*100
    local player_crys     = getPlayerItemCount(cid,2160)*10000
    local player_money     = player_gold + player_plat + player_crys

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,snobleman)
        if player_money >= 150000 then
        if doPlayerRemoveMoney(cid,150000) then
            npcHandler:say('Ah, right! The nobleman addon! Here you go.')
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,snobleman,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 132, 2)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 140, 2)
        end    
        end
        else
            npcHandler:say(noitems)
        end
    else
        npcHandler:say(already)
    end
    end

-- NOBLEMAN END --

function RedRobe(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end
    
    if getPlayerItemCount(cid,2655) >= 1 then
        if doPlayerRemoveItem(cid,2655,1) then
            npcHandler:say('A {Red Robe}! Great. Here, take this red piece of cloth, I don\'t need it anyway.', cid)
            doPlayerAddItem(cid,5911,1)
        end
        else
            npcHandler:say('Are you trying to mess with me?!', cid)
        end
		end
		
function MysticTurban(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end
    
    if getPlayerItemCount(cid,2663) >= 1 then
        if doPlayerRemoveItem(cid,2663,1) then
            npcHandler:say('A {Mystic Turban}! Great. Here, take this blue piece of cloth, I don\'t need it anyway.', cid)
            doPlayerAddItem(cid,5912,1)
        end
        else
            npcHandler:say('Are you trying to mess with me?!', cid)
        end
        end

function GreenTunic(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end
    
    if getPlayerItemCount(cid,2652) >= 150 then
        if doPlayerRemoveItem(cid,2652,150) then
            npcHandler:say('A 150 {Green Tunic}! Great. Here, take this green piece of cloth, I don\'t need it anyway.', cid)
            doPlayerAddItem(cid,5910,1)
        end
        else
            npcHandler:say('Are you trying to mess with me?!', cid)
        end
		end



node1 = keywordHandler:addKeyword({'coat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get nobleman coat you need give me 150,000 gold pieces. Do you have it with you?'})
node1:addChildKeyword({'yes'}, NoblemanFirst, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get nobleman dress you need give me 150,000 gold pieces. Do you have it with you?'})
node2:addChildKeyword({'yes'}, NoblemanFirst, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node3 = keywordHandler:addKeyword({'hat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get nobleman hat you need give me 150,000 gold pieces. Do you have it with you?'})
node3:addChildKeyword({'yes'}, NoblemanSecond, {})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node7 = keywordHandler:addKeyword({'second'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get nobleman hat you need give me 150,000 gold pieces. Do you have it with you?'})
node7:addChildKeyword({'yes'}, NoblemanSecond, {})
node7:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node4 = keywordHandler:addKeyword({'red robe'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Have you found a {Red Robe} for me?'})
node4:addChildKeyword({'yes'}, RedRobe, {})
node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node5 = keywordHandler:addKeyword({'mystic turban'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Have you found a {Mystic Turban} for me?'})
node5:addChildKeyword({'yes'}, MysticTurban, {})
node5:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node6 = keywordHandler:addKeyword({'green tunic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Have you found {150 Green Tunic} for me?'})
node6:addChildKeyword({'yes'}, GreenTunic, {})
node6:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})



npcHandler:addModule(FocusModule:new())
