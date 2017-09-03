local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --

fmage        = 22114    
smage        = 22115
  
newaddon    = 'Ah, right! The Ferumbra\'s Hat! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function MageSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,smage)
    if addon == -1 then
       if getPlayerItemCount(cid,5903) >= 1 then
        if doPlayerRemoveItem(cid,5903,1) then
            npcHandler:say('Ah, right! The mage hat! Here you go.')
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,smage,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 130, 2)
            elseif getPlayerSex(cid) == 0 then 
            doPlayerAddOutfit(cid, 141, 2)	
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
----------------------------------------Paradox-------------------------
function creatureSayCallback(cid, type, msg)
if (not npcHandler:isFocused(cid)) then
        return false
    end

		local queststate = getPlayerStorageValue(cid,6664)
		
		if msgcontains(msg, 'yenny the gentle') and queststate == 1 then
		npcHandler:say('Ah, Yenny the Gentle was one of the founders of the druid order called Crunors Caress, that has been originated in her hometown Carlin.', cid)
        talk_state = 1
		elseif msgcontains(msg, 'crunors caress') and talk_state == 1 then
			npcHandler:say('A quite undruidic order of druids they were, as far as we know. I have no more enlightening knowledge about them though.', cid)
				setPlayerStorageValue(cid,6665,1)
                talk_state = 2
		elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 2) then
			npcHandler:say('Good Bye. |PLAYERNAME|!', cid)
			

			talk_state = 0
		end
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	return true
end


node1 = keywordHandler:addKeyword({'mage hat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get mage hat you need give me a ferumbras\' hat. Do you have them with you?'})
node1:addChildKeyword({'yes'}, MageSecond, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get mage hat you need give me a ferumbras\' hat. Do you have them with you?'})
node2:addChildKeyword({'yes'}, MageSecond, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})




npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())