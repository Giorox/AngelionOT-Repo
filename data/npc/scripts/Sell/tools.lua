local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


shopModule:addBuyableItem({'brown backpack'}, 1988, 20, 'brown backpack')
shopModule:addBuyableItem({'rope'}, 2120, 50, 'rope')
shopModule:addBuyableItem({'scythe'}, 2550, 50, 'scythe')
shopModule:addBuyableItem({'pick'}, 2553, 50, 'pick')
shopModule:addBuyableItem({'shovel'}, 2554, 50, 'shovel')
shopModule:addBuyableItem({'rust remover'}, 9930, 100, 'rust remover')

npcHandler:addModule(FocusModule:new())