local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

function greetCallback(cid)
	if getCreatureCondition(cid, CONDITION_POISON) then
		npcHandler:say('Venture the path of decay!', cid)
		doTeleportThing(cid, {x=33398, y=32852, z=14})
		doSendMagicEffect({x=33398, y=32852, z=14}, CONST_ME_TELEPORT)
	else
		selfSay("Begone! Hissssss! You bear not the mark of the cobra!", cid)
	end
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())