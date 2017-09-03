local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'meat'}, 2666, 5, 'meat')
shopModule:addBuyableItem({'fish'}, 2667, 5, 'fish')
shopModule:addBuyableItem({'salmon'}, 2668, 5, 'salmon')
shopModule:addBuyableItem({'ham'}, 2671, 8, 'ham')
shopModule:addBuyableItem({'dragon ham'}, 2672, 20, 'dragon ham')
shopModule:addBuyableItem({'pear'}, 2673, 4, 'pear')
shopModule:addBuyableItem({'red apple'}, 2674, 3, 'red apple')
shopModule:addBuyableItem({'orange'}, 2675, 10, 'orange')
shopModule:addBuyableItem({'banana'}, 2676, 3, 'banana')
shopModule:addBuyableItem({'blueberry'}, 2677, 1, 'blueberry')
shopModule:addBuyableItem({'cherry'}, 2679, 1, 'cherry')
shopModule:addBuyableItem({'strawberry'}, 2680, 1, 'strawberry')
shopModule:addBuyableItem({'grape'}, 2680, 3, 'grape')
shopModule:addBuyableItem({'melon'}, 2682, 8, 'melon')
shopModule:addBuyableItem({'pumpkin'}, 2683, 10, 'pumpkin')
shopModule:addBuyableItem({'carrot'}, 2684, 3, 'carrot')
shopModule:addBuyableItem({'tomato'}, 2685, 5, 'tomato')
shopModule:addBuyableItem({'corncob'}, 2686, 3, 'corncob')
shopModule:addBuyableItem({'cookie'}, 2687, 2, 'cookie')
shopModule:addBuyableItem({'bread'}, 2689, 4, 'bread')
shopModule:addBuyableItem({'roll'}, 2690, 2, 'roll')
shopModule:addBuyableItem({'brown bread'}, 2691, 3, 'brown bread')
shopModule:addBuyableItem({'egg'}, 2695, 2, 'egg')
shopModule:addBuyableItem({'white mushroom'}, 2787, 6, 'white mushroom')
shopModule:addBuyableItem({'red mushroom'}, 2788, 12, 'red mushroom')
shopModule:addBuyableItem({'brown mushroom'}, 2789, 10, 'brown mushroom')
shopModule:addBuyableItem({'valentine cake'}, 6393, 6, 'valentine cake')
shopModule:addBuyableItem({'cookbook'}, 2347, 150, 'cookbook')

npcHandler:addModule(FocusModule:new())