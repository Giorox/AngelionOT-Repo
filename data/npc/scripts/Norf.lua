local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local node1 = keywordHandler:addKeyword({'first bless'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Here in the whiteflower temple you may receive the blessing of spiritual shielding. But we must ask of you to sacrifice 2000 gold. Are you still interested?'})
	node1:addChildKeyword({'yes'}, StdModule.bless, {npcHandler = npcHandler, number = 4, premium = true, baseCost = 2000, levelCost = 200, startLevel = 30, endLevel = 120})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Oh. You do not have enough money.'})
	
	local node2 = keywordHandler:addKeyword({'spiritual shielding'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Here in the whiteflower temple you may receive the blessing of spiritual shielding. But we must ask of you to sacrifice 2000 gold. Are you still interested?'})
	node1:addChildKeyword({'yes'}, StdModule.bless, {npcHandler = npcHandler, number = 4, premium = true, baseCost = 2000, levelCost = 200, startLevel = 30, endLevel = 120})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Oh. You do not have enough money.'})

npcHandler:addModule(FocusModule:new())