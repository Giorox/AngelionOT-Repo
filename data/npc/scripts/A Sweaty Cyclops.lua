local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end
function creatureSayCallback(cid, type, msg)
 
    if(not npcHandler:isFocused(cid)) then
        return false
    end
   
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    local storage = getPlayerStorageValue(cid, 52180) -- Storage Quest A Sweaty Cyclops
    local storagexorlosh  = getPlayerStorageValue(cid, 52186) -- Storage Xorlosh Mission
    local valuexorlosh = 1  -- Verify Value Xorlosh Mission
    local ironore = 5880 -- Iron Ore ID
    local gearwheel = 9690 -- Gear Wheel ID
	local KosheiExhaust = {
		KosheiAmuletStorage = 3212,
		exhaust_timer24 = 24*60*60
	}
	
   
    -- no Quest
    if storage == -1 then
        if msgcontains(msg, 'uth\'lokr')then
            npcHandler:say("Firy steel it is. Need green ones' breath to melt. Or red even better. Me can make from shield. Lil' one want to trade?", cid)
            talkState[talkUser] = 1
        elseif msgcontains(msg, "yes")then  
            if talkState[talkUser] == 1 then
                npcHandler:say("Wait. Me work no cheap is. Do favour for me first, yes?", cid)
                talkState[talkUser] = 2
            elseif talkState[talkUser] == 2 then
                npcHandler:say("Me need gift for woman. We dance, so me want to give her bast skirt. But she big is. So I need many to make big one. Bring three okay? Me wait.", cid)
                talkState[talkUser] = 3
            elseif talkState[talkUser] == 4 then
                if getPlayerItemCount(cid,3983) >= 3 then
                    npcHandler:say("Good good! Woman happy will be. Now me happy too and help you.", cid)
                    doPlayerRemoveItem(cid,3983,3)
                    setPlayerStorageValue(cid, 52180, 1)
                    talkState[talkUser] = 0
                else
                    npcHandler:say("You do not have the gifts of my girlfriend.", cid)
                end
            elseif talkState[talkUser] == 10 then
                if getPlayerItemCount(cid,2152) >= 50 and getPlayerItemCount(cid,8262) >= 1 and getPlayerItemCount(cid,8263) >= 1 and getPlayerItemCount(cid,8264) >= 1 and  getPlayerItemCount(cid,8265) >= 1 then
                    npcHandler:say("Well, well, I do that! Big Ben makes lil' amulet unbroken with big hammer in big hands! No worry! Come back after sun hits the horizon 24 times and ask me for amulet.",cid)
					doPlayerRemoveItem(cid,8262,1)
                    doPlayerRemoveItem(cid,8263,1)
                    doPlayerRemoveItem(cid,8264,1)
                    doPlayerRemoveItem(cid,8265,1)
                    doPlayerRemoveItem(cid,2152,50)
					exhaustion.set(cid, KosheiExhaust.KosheiAmuletStorage, KosheiExhaust.exhaust_timer24)
                else
                    npcHandler:say("Lil' one no have amulet.", cid)
                end
            end
        elseif msgcontains(msg, "bast skirt")then
            if talkState[talkUser] == 3 then
                npcHandler:say("Lil' one bring three bast skirts?", cid)
                talkState[talkUser] = 4
            end
        elseif msgcontains(msg, "broken") or msgcontains(msg, "amulet") then
			if getPlayerStorageValue(cid, KosheiExhaust.KosheiAmuletStorage) == -1 then
				npcHandler:say("Me can do unbroken but Big Ben want gold 5000 and Big Ben need a lil' time to make it unbroken. Yes or no??", cid)
				talkState[talkUser] = 10
			elseif (not exhaustion.get(cid, KosheiExhaust.KosheiAmuletStorage)) then
				npcHandler:say("Ahh, lil' one wants amulet. Here! Have it! Mighty, mighty amulet lil' one has. Don't know what but mighty, mighty it is!!!", cid)
				doPlayerAddItem(cid,8266,1)
				setPlayerStorageValue(cid, KosheiExhaust.KosheiAmuletStorage, -2)
			elseif exhaustion.get(cid, KosheiExhaust.KosheiAmuletStorage) then
				npcHandler:say("Big Ben no have time to make unbroken. Lil' one come back later.",cid)
			else
				npcHandler:say("Big Ben no has it more! When you also no have it, you have lost mighty, mighty amulet! Stupid li'l one!", cid)
			end
        elseif msgcontains(msg, "no") then
            npcHandler:say("What lil' one want?", cid)
        elseif msgcontains(msg, "uth'kean") or msgcontains(msg, "za'ralator") or msgcontains(msg, "uth'prta") or msgcontains(msg, "soul orb") then
            npcHandler:say("I need 3 bart skirt so I can help you.", cid)
        elseif(msgcontains(msg, "iron ore") or msgcontains(msg, "gear wheel") or msgcontains(msg, "gear wheels")) then
            npcHandler:say("You do not have the gifts of my girlfriend.", cid)
            talkState[talkUser] = 0
        end
    end
    -- True Quest
	 if storage == 1 then
        --Gear Wheel
        if(msgcontains(msg, "iron ore") or msgcontains(msg, "gear wheel") or msgcontains(msg, "gear wheels")) then
            if getPlayerStorageValue(cid,storagexorlosh) > 0 then
                if getPlayerStorageValue(cid, storagexorlosh) < 4 then
                    npcHandler:say("Want to trade iron ore by gear wheel?", cid)
                    talkState[talkUser] = 90
                else
                    npcHandler:say("You've traded 3 Iron Ores with me", cid)
                end
            else
                npcHandler:say("Go to talk with Xorlosh", cid)
            end
        --Amulet
        elseif msgcontains(msg, "broken") or msgcontains(msg, "amulet") then 
			if getPlayerStorageValue(cid, KosheiExhaust.KosheiAmuletStorage) == -1 then
				npcHandler:say("Me can do unbroken but Big Ben want gold 5000 and Big Ben need a lil' time to make it unbroken. Yes or no??", cid)
				talkState[talkUser] = 10
			elseif (not exhaustion.get(cid, KosheiExhaust.KosheiAmuletStorage)) then
				npcHandler:say("Ahh, lil' one wants amulet. Here! Have it! Mighty, mighty amulet lil' one has. Don't know what but mighty, mighty it is!!!", cid)
				doPlayerAddItem(cid,8266,1)
				setPlayerStorageValue(cid, KosheiExhaust.KosheiAmuletStorage, -2)
			elseif exhaustion.get(cid, KosheiExhaust.KosheiAmuletStorage) then
				npcHandler:say("Big Ben no have time to make unbroken. Lil' one come back later.",cid)
			else
				npcHandler:say("Big Ben no has it more! When you also no have it, you have lost mighty, mighty amulet! Stupid li'l one!", cid)
			end
        --Piece of Royal Steel
        elseif msgcontains(msg, "uth'kean") then talkState[talkUser] = 20
            npcHandler:say("Very noble. Shiny. Me like. But breaks so fast. Me can make from shiny armour. Lil' one want to trade?", cid)
        --Piece of Draconian Steel
        elseif msgcontains(msg, "uth'lokr") then talkState[talkUser] = 30
            npcHandler:say("Firy steel it is. Need green ones' breath to melt. Or red even better. Me can make from shield. Lil' one want to trade?", cid)
        --Piece of Hell Steel
        elseif msgcontains(msg, "za'ralator") then talkState[talkUser] = 40
            npcHandler:say("Hellsteel is. Cursed and evil. Dangerous to work with. Me can make from evil helmet. Lil' one want to trade?", cid)
        --Huge Chunk of Crude Iron
        elseif msgcontains(msg, "uth'prta") then talkState[talkUser] = 50
            npcHandler:say("Good iron is. Me friends use it much for fight. Me can make from weapon. Lil' one want to trade?", cid)
        --Infernal Bolts
        elseif msgcontains(msg, "soul orb") then talkState[talkUser] = 60
            npcHandler:say("Uh. Me can make some nasty lil' bolt from soul orbs. Lil' one want to trade all?", cid)
        --No
        elseif msgcontains(msg, "no") then
            npcHandler:say("What do you want here?", cid)
        --Yes
        elseif msgcontains(msg, "yes") then
            --Piece of Royal Steel
            if talkState[talkUser] == 20 then
                if getPlayerItemCount(cid,2487) >= 1 then
                    doPlayerRemoveItem(cid,2487,1)
                    doPlayerAddItem(cid,5887,1)
                    npcHandler:say("Cling clang!", cid)
                else
                    npcHandler:say("Lil' one not have that.", cid)
                end
            --Piece of Draconian Steel
            elseif talkState[talkUser] == 30 then
                if getPlayerItemCount(cid,2516) >= 1 then
                    doPlayerRemoveItem(cid,2516,1)
                    doPlayerAddItem(cid,5889,1)
                    npcHandler:say("Cling clang!", cid)
                else
                    npcHandler:say("Lil' one not have that.", cid)
                end
            --Piece of Hell Steel
            elseif talkState[talkUser] == 40 then
                if getPlayerItemCount(cid,2462) >= 1 then
                    doPlayerRemoveItem(cid,2462,1)
                    doPlayerAddItem(cid,5888,1)
                    npcHandler:say("Cling clang!", cid)
                else
                    npcHandler:say("Lil' one not have that.", cid)
                end
            --Huge Chunk of Crude Iron
            elseif talkState[talkUser] == 50 then
                if getPlayerItemCount(cid,2393) >= 1 then
                    doPlayerRemoveItem(cid,2393,1)
                    doPlayerAddItem(cid,5892,1)
                    npcHandler:say("Cling clang!", cid)
                else
                    npcHandler:say("Lil' one not have that.", cid)
                end
            --Infernal Bolts
            elseif talkState[talkUser] == 60 then
                if getPlayerItemCount(cid,5944) >= 1 then
                    doPlayerRemoveItem(cid,5944,1)
                    doPlayerAddItem(cid,6529,6)
                    npcHandler:say("Cling clang!", cid)
                else
                    npcHandler:say("Lil' one not have that.", cid)
                end
            --Amulet  
            elseif talkState[talkUser] == 10 then
                if getPlayerItemCount(cid,2152) >= 50 and getPlayerItemCount(cid,8262) >= 1 and getPlayerItemCount(cid,8263) >= 1 and getPlayerItemCount(cid,8264) >= 1 and  getPlayerItemCount(cid,8265) >= 1 then
                    npcHandler:say("Well, well, I do that! Big Ben makes lil' amulet unbroken with big hammer in big hands! No worry! Come back after sun hits the horizon 24 times and ask me for amulet.",cid)
					doPlayerRemoveItem(cid,8262,1)
                    doPlayerRemoveItem(cid,8263,1)
                    doPlayerRemoveItem(cid,8264,1)
                    doPlayerRemoveItem(cid,8265,1)
                    doPlayerRemoveItem(cid,2152,50)
					exhaustion.set(cid, KosheiExhaust.KosheiAmuletStorage, KosheiExhaust.exhaust_timer24)
                else
                    npcHandler:say("Lil' one no have amulet.", cid)
                end
            --Gear Wheel
            elseif talkState[talkUser] == 90 then
                if getPlayerItemCount(cid,ironore) >= 1 then
                    setPlayerStorageValue(cid, 52186, valuexorlosh + 1)
                    doPlayerAddItem(cid, gearwheel, 1)
                    doPlayerRemoveItem(cid, ironore, 1)
                    npcHandler:say("Here's your Gear Wheel", cid)
                    talkState[talkUser] = 0
                else
                    npcHandler:say("You've traded 3 Iron Ores with me", cid)
                    talkState[talkUser] = 0
                end
            end
        end
    end
    return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())