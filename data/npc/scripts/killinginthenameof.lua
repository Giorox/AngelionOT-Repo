local tasks =
{
    [1] = {questStarted = 1510, questStorage = 65000, killsRequired = 100, raceName = "Trolls", rewards = {{enable = true, type = "exp", values = 200}, {enable = true, type = "money", values = 200}}},
 
    [2] = {questStarted = 1511, questStorage = 65001, killsRequired = 150, raceName = "Goblins", rewards = {{enable = true, type = "exp", values = 300}, {enable = true, type = "money", values = 250}}},
 
    [3] = {questStarted = 1512, questStorage = 65002, killsRequired = 300, raceName = "Rotworms", rewards = {{enable = true, type = "exp", values = 1000}, {enable = true, type = "money", values = 400}}},
 
    [4] = {questStarted = 1513, questStorage = 65003, killsRequired = 500, raceName = "Cyclops", rewards = {{enable = true, type = "exp", values = 3000}, {enable = true, type = "money", values = 800}}},
 
    [5] = {questStarted = 1514, questStorage = 65004, killsRequired = 300, raceName = "Crocodiles", rewards = {{enable = true, type = "exp", values = 800}, {enable = true, type = "boss", values = THESNAPPER_POSITION}, {enable = true, type = "points", values = 2}}},
 
    [6] = {questStarted = 1515, questStorage = 65005, killsRequired = 300, raceName = "Tarantulas", rewards = {{enable = true, type = "money", values = 1500}, {enable = true, type = "boss", values = HIDE_POSITION}, {enable = true, type = "points", values = 2}}},
 
    [7] = {questStarted = 1516, questStorage = 65006, killsRequired = 150, raceName = "Carniphilas", rewards = {{enable = true, type = "exp", values = 1500}, {enable = true, type = "points", values = 1}}},
 
    [8] = {questStarted = 1517, questStorage = 65007, killsRequired = 200, raceName = "Stone Golems", rewards = {{enable = true, type = "exp", values = 2000}, {enable = true, type = "points", values = 1}}},
 
    [9] = {questStarted = 1518, questStorage = 65008, killsRequired = 300, raceName = "Mammoths", rewards = {{enable = true, type = "exp", values = 4000}, {enable = true, type = "boss", values = THEBLOODTUSK_POSITION}, {enable = true, type = "points", values = 2}}},
 
    [10] = {questStarted = 1519, questStorage = 65009, killsRequired = 300, raceName = "Ice Golems", rewards = {{enable = true, type = "exp", values = 15000}, {enable = true, type = "boss", values = SHARDHEAD_POSITION}, {enable = true, type = "points", values = 2}}},
 
    [11] = {questStarted = 1520, questStorage = 65010, killsRequired = 300, raceName = "Quaras Scout", rewards = {{enable = true, type = "exp", values = 10000}, {enable = true, type = "points", values = 1}}},
 
    [12] = {questStarted = 1521, questStorage = 65011, killsRequired = 300, raceName = "Quaras", rewards = {{enable = true, type = "exp", values = 12000}, {enable = true, type = "boss", values = THUL_POSITION}, {enable = true, type = "points", values = 2}}},
 
    [13] = {questStarted = 1522, questStorage = 65012, killsRequired = 70, raceName = "Water Elementals", rewards = {{enable = true, type = "exp", values = 7000}, {enable = true, type = "points", values = 1}}},
 
    [14] = {questStarted = 1523, questStorage = 65013, killsRequired = 70, raceName = "Earth Elementals", rewards = {{enable = true, type = "exp", values = 10000}, {enable = true, type = "points", values = 1}}},
 
    [15] = {questStarted = 1524, questStorage = 65014, killsRequired = 70, raceName = "Energy Elementals", rewards = {{enable = true, type = "exp", values = 10000}, {enable = true, type = "points", values = 1}}},
 
    [16] = {questStarted = 1525, questStorage = 65015, killsRequired = 70, raceName = "Fire Elementals", rewards = {{enable = true, type = "exp", values = 7000}, {enable = true, type = "points", values = 1}}},
 
    [17] = {questStarted = 1526, questStorage = 65016, killsRequired = 200, raceName = "Mutated Rats", rewards = {{enable = true, type = "exp", values = 10000}, {enable = true, type = "boss", values = ESMERALDA_POSITION}, {enable = true, type = "points", values = 2}}},
 
    [18] = {questStarted = 1527, questStorage = 65017, killsRequired = 500, raceName = "Giant Spiders", rewards = {{enable = true, type = "exp", values = 5000}, {enable = true, type = "boss", values = THEOLDWIDOW_POSITION}, {enable = true, type = "points", values = 2}}},
 
    [19] = {questStarted = 1528, questStorage = 65018, killsRequired = 2000, raceName = "Hydras", rewards = {{enable = true, type = "boss", values = THEMANY_POSITION}, {enable = true, type = "points", values = 4}}},
 
    [20] = {questStarted = 1529, questStorage = 65019, killsRequired = 2000, raceName = "Sea Serpents", rewards = {{enable = true, type = "boss", values = LEVIATHAN_POSITION}, {enable = true, type = "points", values = 4}}},
 
    [21] = {questStarted = 1530, questStorage = 65020, killsRequired = 2000, raceName = "Behemoths", rewards = {{enable = true, type = "boss", values = STONECRACKER_POSITION}, {enable = true, type = "points", values = 4}}},
 
    [22] = {questStarted = 1531, questStorage = 65021, killsRequired = 1500, raceName = "Serpents Spawn", rewards = {{enable = true, type = "teleport", values = THENOXIUSSPAWN_POSITION}, {enable = true, type = "points", values = 4}}},
 
    [23] = {questStarted = 1532, questStorage = 65022, killsRequired = 500, raceName = "Green Djinns", rewards = {{enable = true, type = "exp", values = 10000}, {enable = true, type = "money", values = 5000}, {enable = true, type = "boss", values = MERIKHTHESLAUGHTERER_POSITION}}},
 
    [24] = {questStarted = 1533, questStorage = 65023, killsRequired = 500, raceName = "Blue Djinns", rewards = {{enable = true, type = "exp", values = 10000}, {enable = true, type = "money", values = 5000}, {enable = true, type = "boss", values = FAHIMTHEWISE_POSITION}}},
 
    [25] = {questStarted = 1534, questStorage = 65024, killsRequired = 3000, raceName = "Pirates", rewards = {{enable = true, type = "exp", values = 10000}, {enable = true, type = "money", values = 5000}, {enable = true, type = "boss", values = RANDOMPIRATEBOSS_POSITION}}},
 
    [26] = {questStarted = 1535, questStorage = 65025, killsRequired = 3000, raceName = "Pirates", rewards = {{enable = true, type = "exp", values = 10000}, {enable = true, type = "money", values = 5000}}},
 
    [27] = {questStarted = 1536, questStorage = 65026, killsRequired = 5000, raceName = "Minotaurs", rewards = {{enable = true, type = "boss", values = THEHORNEDFOX_POSITION}}},
 
    [28] = {questStarted = 1537, questStorage = 65027, killsRequired = 4000, raceName = "Magicians", rewards = {{enable = true, type = "boss", values = NECROPHARUS_POSITION}}},
 
    [29] = {questStarted = 1538, questStorage = 65028, killsRequired = 1000, raceName = "Magicians", rewards = {{enable = true, type = "exp", values = 40000}}},
 
    [30] = {questStarted = 1539, questStorage = 65029, killsRequired = 6666, raceName = "Demons", rewards = {{enable = true, type = "storage", values = {65535, 1}}}}
}
 
local rankStorage = 32150
local storage = 64521
 
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local voc = {}
 
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                                      npcHandler:onThink() end
 
function creatureSayCallback(cid, type, msg)
 
    local s = getCreatureStorage(cid, storage)
 
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_PRIVATE and 0 or cid
    if msgcontains(msg, "task") then
 
        if(s < 1) then
            doCreatureSetStorage(cid, storage, 1)
            s = getCreatureStorage(cid, storage)
        end
 
        if(getCreatureStorage(cid, rankStorage) < 1) then
            doCreatureSetStorage(cid, rankStorage, 0)
        end
 
        if tasks[s] then
            if(getCreatureStorage(cid, tasks[s].questStarted) < 1) then
                if(getCreatureStorage(cid, tasks[s].creatureStorage) < 0) then
                    doCreatureSetStorage(cid, tasks[s].creatureStorage, 0)
                end
 
                if(getCreatureStorage(cid, tasks[s].questStorage) < 0) then
                    doCreatureSetStorage(cid, tasks[s].questStorage, 0)
                end
 
                doCreatureSetStorage(cid, tasks[s].questStarted, 1)
                selfSay("You have started the task number " .. getPlayerStorageValue(cid, storage) .. ", in this task you need to kill " .. tasks[s].killsRequired .. " " .. tasks[s].raceName .. ".", cid)
            else
                selfSay("You are currently making the task about " .. tasks[s].raceName .. ", task number " .. getPlayerStorageValue(cid, storage) .. ".", cid)
            end
        else
            print("[Warning - Error::Killing in the name of::Tasks config] Something is wrong.")
        end
 
    elseif msgcontains(msg, "report") then
        if tasks[s] and tasks[s].questStarted > 0 then
            if(getCreatureStorage(cid, tasks[s].creatureStorage) < 0) then
                doCreatureSetStorage(cid, tasks[s].creatureStorage, 0)
            end
 
            if(getCreatureStorage(cid, tasks[s].questStorage) < 0) then
                doCreatureSetStorage(cid, tasks[s].questStorage, 0)
            end
 
            if(getCreatureStorage(cid, tasks[s].questStorage) >= tasks[s].killsRequired) then
                for i = 1, table.maxn(tasks[s].rewards) do
                    if(tasks[s].rewards[i].enable) then
                        if isInArray({"boss", "teleport", 1}, tasks[s].rewards[i].type) then
                            doTeleportThing(cid, tasks[s].rewards[i].values)
                        elseif isInArray({"exp", "experience", 2}, tasks[s].rewards[i].type) then
                            doPlayerAddExperience(cid, tasks[s].rewards[i].values)
                        elseif isInArray({"item", 3}, tasks[s].rewards[i].type) then
                            doPlayerAddItem(cid, tasks[s].rewards[i].values[1], tasks[s].rewards[i].values[2])
                        elseif isInArray({"money", 4}, tasks[s].rewards[i].type) then
                            doPlayerAddMoney(cid, tasks[s].rewards[i].values)
                        elseif isInArray({"storage", "stor", 5}, tasks[s].rewards[i].type) then
                            doCreatureSetStorage(cid, tasks[s].rewards[i].values[1], tasks[s].rewards[i].values[2])
                        elseif isInArray({"points", "rank", 2}, tasks[s].rewards[i].type) then
                            doCreatureSetStorage(cid, rankStorage, getCreatureStorage(cid, rankStorage) + tasks[s].rewards[i].values)
                        else
                            print("[Warning - Error::Killing in the name of::Tasks config] Bad reward type: " .. tasks[s].rewards[i].type .. ", reward could not be loaded.")
                        end
                    end
                end
                local rank = getCreatureStorage(cid, rankStorage)
                selfSay("Great!... you have finished the task number " .. s .. "" .. (rank > 4 and ", you are a " or "") .. "" .. (((rank > 4 and rank < 10) and ("Huntsman") or (rank > 9 and rank < 20) and ("Ranger") or (rank > 19 and rank < 30) and ("Big Game Hunter") or (rank > 29 and rank < 50) and ("Trophy Hunter") or (rank > 49) and ("Elite Hunter")) or "") .. ". Good job.", cid)
                doCreatureSetStorage(cid, storage, s + 1)
            else
                selfSay("Current " .. getCreatureStorage(cid, tasks[s].questStorage) .. " " .. tasks[s].raceName .. " killed, you need to kill " .. tasks[s].killsRequired .. ".", cid)
            end
        else
            selfSay("You do not have started any task.", cid)
        end
    end
    return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())