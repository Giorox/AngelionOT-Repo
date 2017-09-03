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
	
         if player_money >= 5000 then
        if doPlayerRemoveMoney(cid,5000) then
            npcHandler:say('Here it is.', cid)
            local playerID = getPlayerGUID(cid)
                 local item = doPlayerAddItem(cid, 2089, 1)
             doSetItemActionId(item, 3012)
        end
        else
            npcHandler:say('Come back when you have enough money.', cid)
    end
end	

node1 = keywordHandler:addKeyword({'key'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'If you are that curious, do you want to buy a key for 5000 gold? Don\'t blame me if you get sucked in.'})
node1:addChildKeyword({'yes'}, key, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Believe me, it\'s better for you that way.', reset = true})

npcHandler:addModule(FocusModule:new())