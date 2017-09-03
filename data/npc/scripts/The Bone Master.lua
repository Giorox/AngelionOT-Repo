local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --

dream          = 21164
dreamm         = 21165 
ojester        = 29035 
fjester        = 21161
sjester        = 21162

bone        = 'You are a member of The Nightmare Knights, don\'t try to mock me on son.'
newaddon    = 'Ah, right! The Brotherhood of Bones outfit! Here you go.'
noitems        = 'You do not have the demonic essences that i required.'
noitems2    = 'You do not have all the required items or you do not have the range, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, Arghh...'

function JesterFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
        if getPlayerStorageValue(cid,fjester) == -1 then
        if getPlayerItemCount(cid,6500) >= 500 then
        if doPlayerRemoveItem(cid,6500,500) then
            npcHandler:say('You are now a Brotherhood of Bones member. Here take this addon.')
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,fjester,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 278, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 279, 1)
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
	
    if isPremium(cid) then
        if getPlayerStorageValue(cid,fjester) == 1 then
        if getPlayerItemCount(cid,6500) >= 1000 then
        if doPlayerRemoveItem(cid,6500,1000) then
            npcHandler:say('You are worthy of an advancement. I grant you the rank of Death Dealer of our order. Take this addon and shield as symbol of your new status.')
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			doPlayerAddItem(cid, 6433, 1)
			setPlayerStorageValue(cid,sjester,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 278, 2)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 279, 2)
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



node2 = keywordHandler:addKeyword({'first'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get the first Brotherhood of Bones addon you need to give me 500 demonic essences, do you have them with you?'})
node2:addChildKeyword({'yes'}, JesterFirst, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you collected them all.', reset = true})

node3 = keywordHandler:addKeyword({'second'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get the second Brotherhood of Bones addon you need to give me 1000 demonic essences, do you have them with you?'})
node3:addChildKeyword({'yes'}, JesterSecond, {})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you collected them all.', reset = true})

npcHandler:addModule(FocusModule:new())  