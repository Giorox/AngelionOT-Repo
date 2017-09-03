local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'bread'}, 2689, 3, 1,'bread') 
shopModule:addBuyableItem({'cheese'}, 2696, 5, 1,'cheese') 



shopModule:addBuyableItem({'apple'}, 2674, 3, 1,'apple')
shopModule:addBuyableItem({'ham'}, 2671, 8, 1,'ham')
shopModule:addBuyableItem({'meat'}, 2666, 5, 1,'meat')

npcHandler:addModule(FocusModule:new())