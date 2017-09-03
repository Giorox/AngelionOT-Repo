local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --

oassassin    = 22025
fassassin    = 22026
sassassin    = 22027   


newaddon    = 'Ah, right! The assassin katana! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function AssassinSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
        if getPlayerStorageValue(cid,sassassin) == -1 then	
        if getPlayerItemCount(cid,5804) >= 1 and getPlayerItemCount(cid,5930) >= 1 then
        if doPlayerRemoveItem(cid,5804,1) and doPlayerRemoveItem(cid,5930,1) then
            npcHandler:say('Ah, right! The assassin katana! Here you go.')
             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,sassassin,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 152, 2)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 156, 2)
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



node1 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get assassin katana you need give me 1 behemoth claw and 1 nose ring. Do you have them with you?'})
node1:addChildKeyword({'yes'}, AssassinSecond, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})



npcHandler:addModule(FocusModule:new())