local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'banana'}, 2676, 5, 1,'banana') 
shopModule:addBuyableItem({'blueberry'}, 2677, 1, 1,'blueberry') 
shopModule:addBuyableItem({'carrot'}, 2684, 3, 1,'carrot') 
shopModule:addBuyableItem({'cherry'}, 2679, 1, 1,'cherry')
shopModule:addBuyableItem({'corncob'}, 2686, 3, 1,'corncob')



shopModule:addBuyableItem({'grapes'}, 2681, 3, 1,'grapes')
shopModule:addBuyableItem({'juice squeezer'}, 5865, 100, 1,'juice squeezer')
shopModule:addBuyableItem({'lemon'}, 8841, 3, 1,'lemon')
shopModule:addBuyableItem({'mango'}, 5097, 10, 1,'mango')
shopModule:addBuyableItem({'melon'}, 2682, 10, 1,'melon')
shopModule:addBuyableItem({'orange'}, 2675, 10, 1,'orange')
shopModule:addBuyableItem({'potatoe'}, 8838, 4, 1,'potatoe')
shopModule:addBuyableItem({'pumpkin'}, 2683, 10, 1,'pumpkin')
shopModule:addBuyableItem({'strawberry'}, 2680, 2, 1,'strawberry')
shopModule:addBuyableItem({'white mushroom'}, 2787, 10, 1,'white mushroom')
shopModule:addBuyableItem({'sample of venorean spice'}, 4849, 200, 1,'sample of venorean spice')

npcHandler:addModule(FocusModule:new())