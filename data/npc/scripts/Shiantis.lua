local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'birdcage kit'}, 3918, 50, 1,'birdcage kit') 
shopModule:addBuyableItem({'chimney kit'}, 8692, 200, 1,'chimney kit') 
shopModule:addBuyableItem({'coal basin kit'}, 3908, 25, 1,'coal basin kit')
shopModule:addBuyableItem({'cuckoo clock kit'}, 7961, 40, 1,'cuckoo clock kit')
shopModule:addBuyableItem({'globe kit'}, 3927, 50, 1,'globe kit')
shopModule:addBuyableItem({'Goldfish Bowl'}, 5929, 50, 1,'Goldfish Bowl')
shopModule:addBuyableItem({'pendulum clock kit'}, 3933, 75, 1,'pendulum clock kit')
shopModule:addBuyableItem({'picture'}, 1854, 50, 1,'picture')
shopModule:addBuyableItem({'picture'}, 1852, 50, 1,'picture')
shopModule:addBuyableItem({'picture'}, 1853, 50, 1,'picture')
shopModule:addBuyableItem({'table lamp kit'}, 3937, 35, 1,'table lamp kit')
shopModule:addBuyableItem({'telescope kit'}, 7962, 70, 1,'telescope kit')
shopModule:addBuyableItem({'oval mirror'}, 1851, 40, 1,'oval mirror')
shopModule:addBuyableItem({'round mirror'}, 1845, 40, 1,'round mirror')
shopModule:addBuyableItem({'edged mirror'}, 1848, 50, 1,'edged mirror')
shopModule:addBuyableItem({'water pipe'}, 2099, 40, 1,'water pipe')
shopModule:addBuyableItem({'present'}, 1990, 10, 1,'present')
shopModule:addBuyableItem({'red backpack'}, 2000, 20, 1,'red backpack')
shopModule:addBuyableItem({'red bag'}, 1993, 5, 1,'red bag')
shopModule:addBuyableItem({'book'}, 1955, 15, 1,'book')
shopModule:addBuyableItem({'book'}, 1958, 15, 1,'book')
shopModule:addBuyableItem({'book'}, 1950, 15, 1,'book')
shopModule:addBuyableItem({'candelabrum'}, 2041, 8, 1,'candelabrum')
shopModule:addBuyableItem({'football'}, 2109, 111, 1,'football')
shopModule:addBuyableItem({'candlestick'}, 2047, 2, 1,'candlestick')
shopModule:addBuyableItem({'document'}, 1952, 12, 1,'document')
shopModule:addBuyableItem({'parchment'}, 1948, 8, 1,'parchment')
shopModule:addBuyableItem({'scroll'}, 1949, 5, 1,'scroll')
shopModule:addBuyableItem({'torch'}, 2050, 2, 1,'torch')
shopModule:addBuyableItem({'watch'}, 2036, 20, 1,'watch')
shopModule:addBuyableItem({'vial of oil'}, 2006, 15, 11, 'vial of oil')


npcHandler:addModule(FocusModule:new())