local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --

sopirate       = 22031
opirate        = 22032
fpirate        = 22033
spirate        = 22034

newaddon    = 'Ah, right! The pirate sabre! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function PirateFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    if getPlayerStorageValue(cid,fpirate) == -1 then
        if getPlayerItemCount(cid,6126) >= 100 and getPlayerItemCount(cid,6097) >= 100 and getPlayerItemCount(cid,6098) >= 100 then
        if doPlayerRemoveItem(cid,6126,100) and doPlayerRemoveItem(cid,6097,100) and doPlayerRemoveItem(cid,6098,100) then
            npcHandler:say('Ah, right! The pirate sabre! Here you go.')             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,fpirate,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 151, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 155, 1)
        end    
        end
        else
            selfSay(noitems2)
        end
    else
        selfSay(already)
    end
    end

end




node1 = keywordHandler:addKeyword({'sabre'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get pirate sabre you need give me 100 hooks, 100 peg legs and 100 eye patches. Do you have them with you?'})
node1:addChildKeyword({'yes'}, PirateFirst, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get pirate sabre you need give me 100 hooks, 100 peg legs and 100 eye patches. Do you have them with you?'})
node2:addChildKeyword({'yes'}, PirateFirst, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})


npcHandler:addModule(FocusModule:new())