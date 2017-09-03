local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --

obonee 		   = 29037
obone 		   = 29036
ojester        = 29038 
fjester        = 28341
sjester        = 28342

bone        = 'You are a member of The Brotherhood of Bones, don\'t try to mock me on son.'
newaddon    = 'Ah, right! The Nightmare Knight outfit! Here you go.'
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
            npcHandler:say('You are now a Nightmare Knight\'s member. Here take this addon.')
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,fjester,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 268, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 269, 1)  			
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
        if getPlayerStorageValue(cid,sjester) == -1 then
        if getPlayerItemCount(cid,6500) >= 1000 then
        if doPlayerRemoveItem(cid,6500,1000) then
            npcHandler:say('You are worthy of an advancement. I grant you the rank of Death Dealer of our order. Take this addon and shield as symbol of your new status.')
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			doPlayerAddItem(cid, 6391, 1)
			setPlayerStorageValue(cid,sjester,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 268, 2)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 269, 2)
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



node2 = keywordHandler:addKeyword({'first'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get the first Nightmare Knight addon you need to give me 500 demonic essences, do you have them with you?'})
node2:addChildKeyword({'yes'}, JesterFirst, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you collected them all.', reset = true})

node3 = keywordHandler:addKeyword({'second'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get the second Nightmare Knight addon you need to give me 1000 demonic essences, do you have them with you?'})
node3:addChildKeyword({'yes'}, JesterSecond, {})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you collected them all.', reset = true})

npcHandler:addModule(FocusModule:new())  