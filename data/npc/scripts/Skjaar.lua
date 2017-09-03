local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end




function key(cid, message, keywords, parameters, node)
   if(not npcHandler:isFocused(cid)) then
        return false
    end
    
    local player_gold     = getPlayerItemCount(cid,2148)
    local player_plat     = getPlayerItemCount(cid,2152)*100
    local player_crys     = getPlayerItemCount(cid,2160)*10000
    local player_money     = player_gold + player_plat + player_crys
	
         if player_money >= 1000 then
        if doPlayerRemoveMoney(cid,1000) then
            npcHandler:say('Here it is.', cid)
            local playerID = getPlayerGUID(cid)
                 local item = doPlayerAddItem(cid, 2089, 1)
             doSetItemActionId(item, 3142)
        end
        else
            npcHandler:say('You do not have enough gold.', cid)
    end
end	

node1 = keywordHandler:addKeyword({'key'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I would sell you a key for 1000 gold, ok?'})
node1:addChildKeyword({'yes'}, key, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then not.', reset = true})

node2 = keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I would sell you a key for 1000 gold, ok?'})
node2:addChildKeyword({'yes'}, key, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ok, then not.', reset = true})

npcHandler:addModule(FocusModule:new())