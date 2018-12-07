local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end


if msgcontains(msg, 'honey flower') and getPlayerItemCount(cid,2103) >= 1 then
	npcHandler:say("Oh, thank you so much! Please take this piece of armor as reward.", cid)
	doPlayerRemoveItem(cid,2103,1)
    doPlayerAddItem(cid,2468,1)
else
	npcHandler:say("You don't have a honey flower. Come back when you get one.", cid)
end
            


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())