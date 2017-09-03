local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end


-- Storage IDs --
fshaman        = 22020
sshaman        = 22021   

newaddon    = 'Ah, right! The shaman mask! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function ShamanFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if getPlayerStorageValue(cid,fshaman) == -1 then
        if getPlayerItemCount(cid,3955) >= 5 and getPlayerItemCount(cid,5015) >= 1 and getPlayerItemCount(cid,5810) >= 5 then
        if doPlayerRemoveItem(cid,3955,5) and doPlayerRemoveItem(cid,5015,1) and doPlayerRemoveItem(cid,5810,5) then
            npcHandler:say('Ah, right! The shaman staff! Here you go.')             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,fshaman,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 154, 2)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 158, 2)
        end    
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
   
    end

end

function ShamanSecond(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if getPlayerStorageValue(cid,sshaman) == -1 then
        if getPlayerItemCount(cid,3966) >= 5 and getPlayerItemCount(cid,3967) >= 5 then
        if doPlayerRemoveItem(cid,3966,5) and doPlayerRemoveItem(cid,3967,5) then
            npcHandler:say('Ah, right! The shaman mask! Here you go.')             
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,sshaman,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 154, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 158, 1)
        end    
        end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end

end



node1 = keywordHandler:addKeyword({'staff'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get shaman staff you need give me 5 Pirate Voodoo Doll, 5 Dworc Voodoo Dolls and 1 Mandrake. Do you have them with you?'})
node1:addChildKeyword({'yes'}, ShamanFirst, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node3 = keywordHandler:addKeyword({'first'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get shaman staff you need give me 5 Pirate Voodoo Doll, 5 Dworc Voodoo Dolls and 1 Mandrake. Do you have them with you?'})
node3:addChildKeyword({'yes'}, ShamanFirst, {})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'mask'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get shaman mask you need give me 5 banana staffs and 5 tribal masks. Do you have them with you?'})
node2:addChildKeyword({'yes'}, ShamanSecond, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node4 = keywordHandler:addKeyword({'second'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get shaman mask you need give me 5 banana staffs and 5 tribal masks. Do you have them with you?'})
node4:addChildKeyword({'yes'}, ShamanSecond, {})
node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})


npcHandler:addModule(FocusModule:new())