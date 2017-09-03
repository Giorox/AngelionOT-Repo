local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --

fwizard        = 22013 
wizard        = 21314 

newaddon    = 'Ah, right! The wizard skull shoulder pad or wizard wings! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function WizardFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
        if getPlayerItemCount(cid,5922) >= 50 and getPlayerStorageValue(cid,wizard) then
        if doPlayerRemoveItem(cid,5922,50) and getPlayerStorageValue(cid,wizard) then
            npcHandler:say('Ah, right! The wizard skull shoulder pad or wizard wings! Here you go.')             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,wizard,1)
			if getPlayerSex(cid) == 1 then
            doPlayerAddOutfit(cid, 145, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 149, 1)
        end    
        end
        else
            selfSay(noitems2)
        end
    end
    end


node1 = keywordHandler:addKeyword({'skull shoulder pad'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get wizard skull shoulder pad you need give me 50 holy orchids. Do you have them with you?'})
node1:addChildKeyword({'yes'}, WizardFirst, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'wings'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get wizard wings you need give me 50 holy orchids. Do you have them with you?'})
node2:addChildKeyword({'yes'}, WizardFirst, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node3 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get wizard wings you need give me 50 holy orchids. Do you have them with you?'})
node3:addChildKeyword({'yes'}, WizardFirst, {})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})


npcHandler:addModule(FocusModule:new())