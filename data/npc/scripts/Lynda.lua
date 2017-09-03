local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}


function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)           end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)   end
function onThink()                            npcHandler:onThink()                       end




-- Storage IDs --

fmage        = 22663    
smage        = 22006
  
fsummoner    = 22011
ssummoner    = 22012   

newaddon    = 'Ah, right! You want a wand! Here you go.'
noitems        = 'You do not have all the required items.'
noitems2    = 'You do not have all the required items or you do not have the outfit, which by the way, is a requirement for this addon.'
already        = 'It seems you already have this addon, don\'t you try to mock me son!'


function MageFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,fmage)
    if addon == -1 then
        if getPlayerItemCount(cid,2181) >= 1 and getPlayerItemCount(cid,2182) >= 1 and getPlayerItemCount(cid,2183) >= 1 and getPlayerItemCount(cid,2185) >= 1 and getPlayerItemCount(cid,2186) >= 1 and getPlayerItemCount(cid,2187) >= 1 and getPlayerItemCount(cid,2188) >= 1 and getPlayerItemCount(cid,2189) >= 1 and getPlayerItemCount(cid,2190) >= 1 and getPlayerItemCount(cid,2191) >= 1 and getPlayerItemCount(cid,5904) >= 10 and getPlayerItemCount(cid,2193) >= 20 and getPlayerItemCount(cid,5809) >= 1 then
        if doPlayerRemoveItem(cid,2181,1) and doPlayerRemoveItem(cid,2182,1) and doPlayerRemoveItem(cid,2183,1) and doPlayerRemoveItem(cid,2185,1) and doPlayerRemoveItem(cid,2186,1) and doPlayerRemoveItem(cid,2187,1) and doPlayerRemoveItem(cid,2188,1) and doPlayerRemoveItem(cid,2189,1) and doPlayerRemoveItem(cid,2190,1) and doPlayerRemoveItem(cid,2191,1) and doPlayerRemoveItem(cid,5904,10) and doPlayerRemoveItem(cid,2193,20) and doPlayerRemoveItem(cid,5809,1) then
            npcHandler:say('Ah, right! You want a wand! Here you go.')
            doSendMagicEffect(getCreaturePosition(cid), 13)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 130, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 141, 1)
			setPlayerStorageValue(cid,fmage, 1)
        end
		end
        else
            selfSay(noitems)
        end
    else
        selfSay(already)
    end
    end

end





node1 = keywordHandler:addKeyword({'mage wand'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get mage wand you need give me wand of vortex,wand of dragonbreath,wand of decay,wand of cosmic energy, wand of inferno, snakebite rod, moonlight rod, necrotic rod, terra rod, hailstorm rod, 10 magic sulphurs, 20 ankhs and a soul stone. Do you have it with you?'})
node1:addChildKeyword({'yes'}, MageFirst, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node3 = keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get mage wand you need give me wand of vortex,wand of dragonbreath,wand of decay,wand of cosmic energy, wand of inferno, snakebite rod, moonlight rod, necrotic rod, terra rod, hailstorm rod, 10 magic sulphurs, 20 ankhs and a soul stone. Do you have it with you?'})
node3:addChildKeyword({'yes'}, MageFirst, {})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'summoner wand'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get summoner wand you need give me wand of vortex,wand of dragonbreath,wand of decay,wand of cosmic energy, wand of inferno, snakebite rod, moonlight rod, necrotic rod, terra rod, hailstorm rod, 10 magic sulphurs, 20 ankhs and a soul stone. Do you have it with you?'})
node2:addChildKeyword({'yes'}, SummonerFirst, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())