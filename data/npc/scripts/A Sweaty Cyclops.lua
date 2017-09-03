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
                    npcHandler:say("Ahh, lil' one wants amulet. Here! Have it! Mighty, mighty amulet lil' one has. Don't know what but mighty, mighty it is!!!", cid)
                    doPlayerRemoveItem(cid,8262,1)
                    doPlayerRemoveItem(cid,8263,1)
                    doPlayerRemoveItem(cid,8264,1)
                    doPlayerRemoveItem(cid,8265,1)
                    doPlayerRemoveItem(cid,2152,50)
                    doPlayerAddItem(cid,8266,1)
                else
                    npcHandler:say("Come back when you got the neccessary items.", cid)
                end
            end
        elseif msgcontains(msg, "bast skirt")then
            if talkState[talkUser] == 3 then
                npcHandler:say("Lil' one bring three bast skirts?", cid)
                talkState[talkUser] = 4
            end
        elseif msgcontains(msg, "broken") or msgcontains(msg, "amulet") then
            npcHandler:say("Me can do unbroken but Big Ben want 5000 gold to make it unbroken. You accept??", cid)
            talkState[talkUser] = 10
        elseif msgcontains(msg, "no") then
            npcHandler:say("What do you want here?", cid)
        elseif msgcontains(msg, "help") then
            npcHandler:say("I can forge Amulet, Huge Chunk of Crude Iron, Piece of Draconian Steel, Piece of Royal Steel, Piece of Hell Steal and Infernal Bolts!", cid)
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
        elseif msgcontains(msg, "broken") or msgcontains(msg, "amulet") then talkState[talkUser] = 10
            npcHandler:say("Me can do unbroken but Big Ben want 5000 gold to make it unbroken. You accept??", cid)
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
        --Help
        elseif msgcontains(msg, "help") then
            npcHandler:say("I can forge Amulet, Huge Chunk of Crude Iron, Piece of Draconian Steel, Piece of Royal Steel, Piece of Hell Steal and Infernal Bolts!", cid)
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
                    npcHandler:say("Come back when you got the neccessary items.", cid)
                end
            --Piece of Draconian Steel
            elseif talkState[talkUser] == 30 then
                if getPlayerItemCount(cid,2516) >= 1 then
                    doPlayerRemoveItem(cid,2516,1)
                    doPlayerAddItem(cid,5889,1)
                    npcHandler:say("Cling clang!", cid)
                else
                    npcHandler:say("Come back when you got the neccessary items.", cid)
                end
            --Piece of Hell Steel
            elseif talkState[talkUser] == 40 then
                if getPlayerItemCount(cid,2462) >= 1 then
                    doPlayerRemoveItem(cid,2462,1)
                    doPlayerAddItem(cid,5888,1)
                    npcHandler:say("Cling clang!", cid)
                else
                    npcHandler:say("Come back when you got the neccessary items.", cid)
                end
            --Huge Chunk of Crude Iron
            elseif talkState[talkUser] == 50 then
                if getPlayerItemCount(cid,2393) >= 1 then
                    doPlayerRemoveItem(cid,2393,1)
                    doPlayerAddItem(cid,5892,1)
                    npcHandler:say("Cling clang!", cid)
                else
                    npcHandler:say("Come back when you got the neccessary items.", cid)
                end
            --Infernal Bolts
            elseif talkState[talkUser] == 60 then
                if getPlayerItemCount(cid,5944) >= 1 then
                    doPlayerRemoveItem(cid,5944,1)
                    doPlayerAddItem(cid,6529,6)
                    npcHandler:say("Cling clang!", cid)
                else
                    npcHandler:say("Come back when you got the neccessary items.", cid)
                end
            --Amulet  
            elseif talkState[talkUser] == 10 then
                if getPlayerItemCount(cid,2152) >= 50 and getPlayerItemCount(cid,8262) >= 1 and getPlayerItemCount(cid,8263) >= 1 and getPlayerItemCount(cid,8264) >= 1 and  getPlayerItemCount(cid,8265) >= 1 then
                    npcHandler:say("Ahh, lil' one wants amulet. Here! Have it! Mighty, mighty amulet lil' one has. Don't know what but mighty, mighty it is!!!", cid)
                    doPlayerRemoveItem(cid,8262,1)
                    doPlayerRemoveItem(cid,8263,1)
                    doPlayerRemoveItem(cid,8264,1)
                    doPlayerRemoveItem(cid,8265,1)
                    doPlayerRemoveItem(cid,2152,50)
                    doPlayerAddItem(cid,8266,1)
                else
                    npcHandler:say("Come back when you got the neccessary items.", cid)
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