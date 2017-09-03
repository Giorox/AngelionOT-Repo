local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --

fwarrior        = 22038
swarrior        = 22039

newaddon    = 'Ah, right! The warrior shoulder spike! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function WarriorFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,fwarrior)
    if addon == -1 then
        if getPlayerItemCount(cid,5925) >= 100 and getPlayerItemCount(cid,5899) >= 100 and getPlayerItemCount(cid,5884) >= 1 and getPlayerItemCount(cid,10020) >= 1 then
        if doPlayerRemoveItem(cid,5925,100) and doPlayerRemoveItem(cid,5899,100) and doPlayerRemoveItem(cid,5884,1) and doPlayerRemoveItem(cid,10020,1) then
            npcHandler:say('Ah, right! The warrior shoulder spike! Here you go.')             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,fwarrior,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 134, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 142, 1)
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





node1 = keywordHandler:addKeyword({'shoulder spike'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get warrior shoulder spike you need give me 100 hardened bones, 100 turtle shells, a fighting spirit and a dragon claw. Do you have it with you?'})
node1:addChildKeyword({'yes'}, WarriorFirst, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get warrior shoulder spike you need give me 100 hardened bones, 100 turtle shells, a fighting spirit and a dragon claw. Do you have it with you?'})
node2:addChildKeyword({'yes'}, WarriorFirst, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})



npcHandler:addModule(FocusModule:new())