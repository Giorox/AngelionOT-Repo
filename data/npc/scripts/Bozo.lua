local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --

ojester        = 22035 
fjester        = 22036
sjester        = 22037

newaddon    = 'Ah, right! The jester outfit! Here you go, now you are complete fool.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'

function JesterFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

	local player_gold     = getPlayerItemCount(cid,2148)
    local player_plat     = getPlayerItemCount(cid,2152)*100
    local player_crys     = getPlayerItemCount(cid,2160)*10000
    local player_money     = player_gold + player_plat + player_crys

    if isPremium(cid) then
        if getPlayerStorageValue(cid,fjester) == -1 then
        if getPlayerItemCount(cid,5879) >= 1 and getPlayerItemCount(cid,5878) >= 4 and player_money >= 10000 then
        if doPlayerRemoveItem(cid,5879,1) and doPlayerRemoveItem(cid,5878,4) and doPlayerRemoveMoney(cid,10000) then
            npcHandler:say('You\'re hell of a guy, I bet you enjoyed it. As you represent everything a fool stands for, I give you this fool\'s sceptre to spiceup your jester outfit.')
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,fjester,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 273, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 270, 1)
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

function JesterSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

	local player_gold     = getPlayerItemCount(cid,2148)
    local player_plat     = getPlayerItemCount(cid,2152)*100
    local player_crys     = getPlayerItemCount(cid,2160)*10000
    local player_money     = player_gold + player_plat + player_crys
	
    if isPremium(cid) then
        if getPlayerStorageValue(cid,sjester) == -1 then
        if getPlayerItemCount(cid,5909) >= 5 and player_money >= 10000 then
        if doPlayerRemoveItem(cid,5909,5) and doPlayerRemoveMoney(cid,10000) then
            npcHandler:say('By Kurik, I knew you have it in you. You are a fool after my fancy. Take this jester hat, you deserve it. It will go nicely with your jester costume.')
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,sjester,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 273, 2)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 270, 2)
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



node2 = keywordHandler:addKeyword({'staff'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get jester staff you need to give me a giant spider silk, 4 minotaur leathers and 10000 gold coins. Do you have them with you?'})
node2:addChildKeyword({'yes'}, JesterFirst, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node3 = keywordHandler:addKeyword({'hat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get jester hat you need to give me 5 white piece of cloth and 10000 gold coins. Do you have them with you?'})
node3:addChildKeyword({'yes'}, JesterSecond, {})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

npcHandler:addModule(FocusModule:new())  