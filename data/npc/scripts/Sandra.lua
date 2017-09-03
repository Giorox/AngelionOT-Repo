local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)    npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()    end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
function creatureSayCallback(cid, type, msg)
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    if (not npcHandler:isFocused(cid)) then
        return false
    end

        if msgcontains(msg, 'vial') then
                npcHandler:say('We have a special offer right now for depositing vials. Are you interested in hearing it?', cid)
                talk_state = 1
      elseif msgcontains(msg, 'yes') and talk_state == 1 then
             npcHandler:say('Great! I\'ve signed you up for our bonus for lottery {ticket}. From now on, you will have the chance to win the potion belt addon!', cid)
             talk_state = 0   
      elseif msgcontains(msg, 'ticket') then
             npcHandler:say('Would you like to get a lottery ticket instead of the {deposit} for your vials.', cid)
             talk_state = 1
      elseif msgcontains(msg, 'deposit') and talk_state == 1 then          
            if getPlayerItemCount(cid, 7636) >= 100 or getPlayerItemCount(cid, 7635) >= 100 or getPlayerItemCount(cid, 7634) >= 100 then
                    npcHandler:say('Here, take this lottery ticket and let\'s hope you got some luck', cid)
            if doPlayerRemoveItem(cid, 7636,100) or doPlayerRemoveItem(cid, 7635,100) or doPlayerRemoveItem(cid, 7634,100) then
                    doPlayerAddItem(cid, 5957, 1)
                    talk_state = 0
            else
                npcHandler:say('Sorry you need 100 empty vials to you from the lottery ticket', cid)
                talkState[talkUser] = 0
                end
        elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 3) then
            npcHandler:say('Ok thanks.', cid)
            talk_state = 0
        end
        return TRUE
end
end
-- Storage IDs --

fmage        = 22005    
smage        = 22006
  
fsummoner    = 22011
ssummoner    = 22012   

newaddon    = 'Ah, right! The fluid belt! Here you go.'
noitems        = 'You do not have it!.'
noitems2    = 'You do not have all the required items.'
already        = 'It seems you already have this addon, don\'t you try to mock me!'


function MageFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,fmage)
    if addon == -1 then
       if getPlayerItemCount(cid,5958) >= 1 then
        if doPlayerRemoveItem(cid,5958,1) then
            npcHandler:say('Ah, right! The mage fluid belt! Here you go.')
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,fmage,1)
			if getPlayerSex(cid) == 1 then
            doPlayerAddOutfit(cid, 133, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 138, 1)		
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

function SummonerFirst(cid, message, keywords, parameters, node)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if isPremium(cid) then
    addon = getPlayerStorageValue(cid,fsummoner)
    if addon == -1 then
       if getPlayerItemCount(cid,5958) >= 1 then
        if doPlayerRemoveItem(cid,5958,1) then
            npcHandler:say('Ah, right! The summoner fluid belt! Here you go.')
            doSendMagicEffect(getCreaturePosition(cid), 13)
			setPlayerStorageValue(cid,fsummoner,1)
				if getPlayerSex(cid) == 1 then
            doPlayerAddOutfit(cid, 133, 1)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 138, 1)		
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
-------------------------------------------------SHOP---------------------------------------------------------
shopModule:addBuyableItem({'health potion'}, 7618, 45, 1, 'health potion')
shopModule:addBuyableItem({'mana potion'}, 7620, 50, 1, 'mana potion')
shopModule:addBuyableItem({'strong health'}, 7588, 100, 1, 'strong health potion')
shopModule:addBuyableItem({'vial of oil'}, 2006, 15, 11, 'vial of oil')
shopModule:addBuyableItem({'vial of water'}, 2006, 15, 11, 'vial of oil')
shopModule:addBuyableItem({'strong mana'}, 7589, 80, 1, 'strong mana potion')
shopModule:addBuyableItem({'great health'}, 7591, 190, 1, 'great health potion')
shopModule:addBuyableItem({'great mana'}, 7590, 120, 1, 'great mana potion')
shopModule:addBuyableItem({'great spirit'}, 8472, 190, 1, 'great spirit potion')
shopModule:addBuyableItem({'ultimate health'}, 8473, 310, 1, 'ultimate health potion')

shopModule:addSellableItem({'normal potion flask', 'normal flask'}, 7636, 5, 'empty small potion flask')
shopModule:addSellableItem({'strong potion flask', 'strong flask'}, 7634, 10, 'empty strong potion flask')
shopModule:addSellableItem({'great potion flask', 'great flask'}, 7635, 15, 'empty great potion flask')


shopModule:addBuyableItemContainer({'bp hp'}, 2000, 7618, 900, 1, 'backpack of health potions')
shopModule:addBuyableItemContainer({'bp mp'}, 2001, 7620, 1000, 1, 'backpack of mana potions')
shopModule:addBuyableItemContainer({'bp shp'}, 2000, 7588, 2000, 1, 'backpack of strong health potions')
shopModule:addBuyableItemContainer({'bp smp'}, 2001, 7589, 1600, 1, 'backpack of strong mana potions')
shopModule:addBuyableItemContainer({'bp ghp'}, 2000, 7591, 3800, 1, 'backpack of great health potions')
shopModule:addBuyableItemContainer({'bp gmp'}, 2001, 7590, 2400, 1, 'backpack of great mana potions')
shopModule:addBuyableItemContainer({'bp gsp'}, 1999, 8472, 3820, 1, 'backpack of great spirit potions')
shopModule:addBuyableItemContainer({'bp uhp'}, 2000, 8473, 6200, 1, 'backpack of ultimate health potions')

--------



node1 = keywordHandler:addKeyword({'mage fluid belt'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get mage fluid belt you need give me the winning lottery ticket. Do you have it with you?'})
node1:addChildKeyword({'yes'}, MageFirst, {})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node4 = keywordHandler:addKeyword({'mage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get mage fluid belt you need give me the winning lottery ticket. Do you have it with you?'})
node4:addChildKeyword({'yes'}, MageFirst, {})
node4:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node2 = keywordHandler:addKeyword({'summoner fluid belt'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get summoner fluid belt you need give me the winning lottery ticket. Do you have it with you?'})
node2:addChildKeyword({'yes'}, SummonerFirst, {})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})

node3 = keywordHandler:addKeyword({'summoner'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To get summoner fluid belt you need give me the winning lottery ticket. Do you have it with you?'})
node3:addChildKeyword({'yes'}, SummonerFirst, {})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then. Come back when you got all neccessary items.', reset = true})


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())