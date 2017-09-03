local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'bread'}, 2689, 4, 1,'bread') 
shopModule:addBuyableItem({'cheese'}, 2696, 6, 1,'cheese') 



shopModule:addBuyableItem({'cookie'}, 2687, 2, 1,'cookie')
shopModule:addBuyableItem({'tomato'}, 2685, 3, 1,'tomato')
shopModule:addBuyableItem({'egg'}, 2695, 2, 1,'egg')
shopModule:addBuyableItem({'ham'}, 2671, 8, 1,'ham')
shopModule:addBuyableItem({'meat'}, 2666, 5, 1,'meat')

npcHandler:addModule(FocusModule:new())