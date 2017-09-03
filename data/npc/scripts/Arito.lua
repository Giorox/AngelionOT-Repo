local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'bread'}, 2689, 8, 1,'bread') 
shopModule:addBuyableItem({'cheese'}, 2696, 12, 1,'cheese') 
shopModule:addBuyableItem({'fish'}, 2667, 6, 1,'fish') 
shopModule:addBuyableItem({'fish'}, 2012, 1, 1,'mug of water') 



shopModule:addBuyableItem({'ham'}, 2671, 16, 1,'ham')
shopModule:addBuyableItem({'meat'}, 2666, 10, 1,'meat')

npcHandler:addModule(FocusModule:new())