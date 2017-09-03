<?xml version="1.0" encoding="UTF-8"?>
<mod name="Guild War System" version="0.3.6+" author="Xampy and Nahruto" contact="otland.net" enabled="yes">
<config name="function_config"><![CDATA[
DelayToCancel = 24
 
Maps = {
        ["map1"] =
                {
                        Guild1Pos = {x=238, y=442, z=12},
                        Guild2Pos = {x=244, y=442, z=12}
                },
        ["map2"] =
                {
                        Guild1Pos = {x=994, y=1004, z=6},
                        Guild2Pos = {x=1000, y=1003, z=6}                      
                }
        }
 
TimeToTeleport = 1 --minutes, when start a challenge
StopBattle = TRUE --Stop battle after X time ? TRUE  /  FALSE
TimeToStop = 60 --Minutes Time to Stop if StopBattle = TRUE.
 
--Cancel messages~
CancelMessagesWar = {
        --Message when player try accept/reject/cancel a war but there is no a invitation.
        [1] = "Not pending invitations.",
        --Message when the player is not the guild leader.
        [2] = "Only Guild Leader can execute this command.",
        --Message when try Cancel the invitation but the war is already accepted.
        [3] = "The war is already accepted.",
        --MEssage when the invited guild name is not correct or does not exist.
        [4] = "Not correct guild name.",
        --Message when try invite any guild to a war but his guild already have a war or a pending invitation.
        [5] = "Your guild is already in war or have a pending invitation.",
        --Same of the cancel message 5 but the the enemy guild.
        [6] = "This guild is already in war or have a pending invitation.",
        --Message when use invite command but not write guild name.
        [7] = "Command needs param.",
        --Message when try invite his guild.
        [8] = "You can\'t invite you guild.",
        --Message when the map name is not correct.
        [9] = "Please write a correct name.",
        --Message when try go to any map but the guild is have no received/sent any war invitation
        [10] = "Your guild is not in any war.",
        --When try to cancel a war before the delay
        [11] = "You should wait ".. DelayToCancel .." hours to cancel the war"
        }
 
--Broadcast messages when invite/accept/reject/cancel ~ Remember the Spaces.
BroadCast_Type = MESSAGE_EVENT_ADVANCE
BroadCast = {
        --Message when inviting
        [1] =
                {
                        "Guild ",
                        --Here will be the guild name
                        " have invited guild ",
                        --Here will be the invited guild name
                        " to have a war."
                },
        --Message when accept.
        [2] =
                {
                        "Guild ",
                        --Here will be the guild name
                        " have accepted the invitation of the guild " ,
                        --Here will be the name of the guild who have invited em.
                        " to have a war."
                },
        --Message when reject.
        [3] =
                {
                        "Guild ",
                        --Here will be the guild name
                        " have rejected the invitation of the guild " ,
                        --Here will be the name of the guild who have invited em.
                        " to have a war."
                },
        --Message when cancel.
        [4] =
                {
                        "Guild ",
                        --Here will be the guild name
                        " have canceled the invitation to the guild " ,
                        --Here will be the name of the guild who have invited em.
                        " to have a war."
                },
        --Message whenstar a battle..
        [5] =
                {
                        "Guild ",
                        --Here will be the guild name
                        " and guild " ,
                        --Here will be the name of the guild who have invited em.
                        " will have a battle in the map :"
                },
        --message when a battle ends.
        [6] =
                {
                        "The battle betwen guild ",
                        --Here will be the guild name
                        " and guild " ,
                        --Here will be the name of the guild who have invited em.
                        " its over."
                },
        }
 
--Functions ~.
 
function getShowInfo(id)
        local Info = db.getResult("SELECT `show` FROM `guilds` WHERE `id` = " .. id .. "")
        if Info:getID() ~= -1 then
                local showy = Info:getDataInt("show")
                Info:free()
                return showy
        end
        return -1
end
 
function getKills(name)
        local Info = db.getResult("SELECT `kills` FROM `guilds` WHERE `name` = '"..name.."'")
        if Info:getID() ~= -1 then
                local killy = Info:getDataInt("kills")
                Info:free()
                return killy
        end
        return -1
end
 
function getGuildWarInfo(id)
        local Info = db.getResult("SELECT `invited_to`, `invited_by`, `in_war_with`,`war_time` FROM `guilds` WHERE `id` = " .. id .. "")
        if Info:getID() ~= -1 then
                local invTo, invBy, warWith, Time = Info:getDataInt("invited_to"), Info:getDataInt("invited_by"), Info:getDataInt("in_war_with"), Info:getDataInt("war_time")
                Info:free()
                return {To = invTo, By = invBy, With = warWith, T = Time}
        end
        return -1
end
 
function getGuildNameById(id)
        local Info = db.getResult("SELECT `name` FROM `guilds` WHERE `id` = " .. id .. "")
                if Info:getID() ~= -1 then
                local Name = Info:getDataString("name")
                Info:free()
                return Name
        end
        return -1
end
 
function GuildIsInPEace(id)
        local Info = getGuildWarInfo(id)
        return (Info.To == 0 and Info.By == 0 and Info.With == 0)
end
 
function doInviteToWar(myGuild, enemyGuild)
        local StartTime = os.time()
        db.executeQuery("UPDATE `guilds` SET `invited_to` = ".. enemyGuild ..", `war_time` = ".. StartTime .." WHERE `id` = ".. myGuild .."")
        db.executeQuery("UPDATE `guilds` SET `invited_by` = ".. myGuild .." WHERE `id` = ".. enemyGuild .."")
end
 
function WarAccept(myGuild, enemyGuild)
        local StartTime = os.time()
        db.executeQuery("UPDATE `guilds` SET `invited_to` = 0, `invited_by` = 0, `in_war_with`  =  ".. myGuild ..", `kills` = 0, `show` = 1 WHERE `id` = ".. enemyGuild .."")
        db.executeQuery("UPDATE `guilds` SET `invited_to` = 0, `invited_by` = 0, `war_time` = ".. StartTime ..", `in_war_with`  =  ".. enemyGuild ..", `kills` = 0, `show` = 0 WHERE `id` = ".. myGuild .."")
end
 
function cleanInfo(myGuild)
        db.executeQuery("UPDATE `guilds` SET `invited_to` = 0, `invited_by` = 0, `war_time` = 0, `in_war_with`  =  0, `kills` = 0, `show` = 0 WHERE `id` = ".. myGuild .."")
end
 
function registerDeathOne(myGuild, enemyGuild, cid, target)
        db.executeQuery("INSERT INTO `deaths_in_wars` (`guild_id`, `player_id`, `killer_guild`, `killer`, `date`, `result1`, `result2`) VALUES ("..enemyGuild..", "..getPlayerGUID(target)..", "..myGuild..", "..getPlayerGUID(cid)..", " .. os.time() ..", 1, 0);")      
        db.executeQuery("UPDATE `guilds` SET `kills` = `kills` + 1 WHERE `id` = ".. myGuild .."")
end
 
function registerDeathTwo(myGuild, enemyGuild, cid, target)
        db.executeQuery("INSERT INTO `deaths_in_wars` (`guild_id`, `player_id`, `killer_guild`, `killer`, `date`, `result1`, `result2`) VALUES ("..enemyGuild..", "..getPlayerGUID(target)..", "..myGuild..", "..getPlayerGUID(cid)..", " .. os.time() ..", 0, 1);")      
        db.executeQuery("UPDATE `guilds` SET `kills` = `kills` + 1 WHERE `id` = ".. myGuild .."")
end
 
function removeDeaths(id)
        db.executeQuery("DELETE FROM `deaths_in_wars` WHERE `guild_id` = " ..id .. ";")
end
 
function StopWar(myGuild, enemyGuild)
        cleanInfo(myGuild)
        cleanInfo(enemyGuild)
        removeDeaths(myGuild)
        removeDeaths(enemyGuild)
end
 
function WeAreInWar(myGuild, enemyGuild)
        local myGuildInfo = getGuildWarInfo(myGuild)
        local enemyGuildInfo = getGuildWarInfo(enemyGuild)
        if myGuild == enemyGuildInfo.With and enemyGuild ==  myGuildInfo.With then
                if enemyGuildInfo.ON == 1 and myGuildInfo.ON == 1 then
                        return TRUE
                end            
        end
        return FALSE
end
 
function getOnlineMembers(id)
        local PlayersOnline = getPlayersOnline()
        local MembersOnline = {}
        for i, pid in ipairs(PlayersOnline) do
                if id == getPlayerGuildId(PlayersOnline[i]) then
                        table.insert(MembersOnline, PlayersOnline[i])
                end
        end
        return MembersOnline
end
 
function teleportGuild(id, pos)
        local Members = getOnlineMembers(id)
        if #Members > 0 then
        for i = 1, #Members do
                if #Members > 1 then
                        if getTilePzInfo(getCreaturePosition(Members[i])) == TRUE then
                                doTeleportThing(Members[i], pos, FALSE)
                                doSendMagicEffect(pos, CONST_ME_TELEPORT)
                                doSendMagicEffect(getCreaturePosition(Members[i]), CONST_ME_POFF)
                                doPlayerSendTextMessage(Members[i], 22, 'Prepare to fight!')
                        else
                                doPlayerPopupFYI(Members[i], 'GuildWar challenge error:\n\nBoth guild members must stay in Protection Zone.')
                        end
                else
                        doPlayerPopupFYI(Members[i], 'GuildWar challenge error:\n\nBoth guilds must have more than one player online (leader & any member, at least).')
                end
        end
        end
end
 
function getGuildsWithWar()
        local res = db.getResult("SELECT `id` FROM `guilds` WHERE `in_war_with` > 0")
        local GuildW = {}
        if res:getID() ~= -1 then
                while true do
                        table.insert(GuildW, res:getDataInt "id")
                        if not res:next() then
                                break
                        end
                end
                res:free()
        end
        return GuildW
end
 
function guildExist(nom)
        local Get = db.getResult("SELECT `id` FROM `guilds` WHERE `name` = " .. db.escapeString(nom) .. ";")
        if Get:getID() ~= -1 then
                local ret = Get:getDataInt("id")
                Get:free()
                return ret
        end
        return -1
end
 
function StartWar(x)
        teleportGuild(x.myGuild, Maps[x.map].Guild1Pos)
        teleportGuild(x.enemyGuild, Maps[x.map].Guild2Pos)
 
        if StopBattle == TRUE then
                addEvent(StopWarNow, 60 * 1000, {myGuild = x.myGuild, enemyGuild = x.enemyGuild})
        end
end    
 
function StopWarNow(c)
        StopWar(c.myGuild, c.enemyGuild)
        doBroadcastMessage(BroadCast[6][1] ..getGuildNameById(c.myGuild).. BroadCast[6][2] ..getGuildNameById(c.enemyGuild).. BroadCast[6][3], BroadCast_Type)
end
 
function putWarOn(myGuild, enemyGuild)
        db.executeQuery("UPDATE `guilds` SET `war_time`  = 1 WHERE `id` = ".. myGuild .."")
        db.executeQuery("UPDATE `guilds` SET `war_time`  = 1 WHERE `id` = ".. enemyGuild .."")
end]]></config>
 
 
<talkaction words="!disband; /war-invite; /war-accept; /war-reject; /war-cancel-invite; /war-cancel" event="script"><![CDATA[
domodlib('function_config')
function onSay(cid, words, param, channel)
        if getPlayerGuildLevel(cid) == GUILDLEVEL_LEADER then
                local myGuild = getPlayerGuildId(cid)
                if words == "/war-invite" then
                        if GuildIsInPEace(myGuild) == true then
                                if param ~= "" then
                                        if guildExist(param) ~= -1 then
                                                local invitedGuild = getGuildId(param)
                                                if invitedGuild ~= -1 then
                                                        if invitedGuild ~= myGuild then
                                                                if GuildIsInPEace(invitedGuild) == true then
                                    if getPlayerStorageValue(cid, 65570) <= os.time() then
                                                                            doInviteToWar(myGuild, invitedGuild)
                                                                            doBroadcastMessage(BroadCast[1][1] ..getPlayerGuildName(cid).. BroadCast[1][2] ..getGuildNameById(invitedGuild).. BroadCast[1][3], BroadCast_Type)
                                        setPlayerStorageValue(cid, 65570, os.time()+(20*60))
                                    else
                                        local waitTime = (getPlayerStorageValue(cid, 65570) - os.time())
                                        doPlayerSendCancel(cid, "You must wait " .. os.date("%M", waitTime) .. " minutes and " .. os.date("%S", waitTime) .. " seconds until declare another war.")
                                    end
                                                                else
                                                                        doPlayerSendCancel(cid, CancelMessagesWar[6])
                                                                end
                                                        else
                                                                doPlayerSendCancel(cid, CancelMessagesWar[8])
                                                        end
                                                else
                                                        doPlayerSendCancel(cid, CancelMessagesWar[4])
                                                end
                                        else
                                                doPlayerSendCancel(cid, CancelMessagesWar[4])
                                        end
                                else
                                        doPlayerSendCancel(cid, CancelMessagesWar[7])
                                end
                        else
                                doPlayerSendCancel(cid, CancelMessagesWar[5])
                        end
                elseif words == "/war-accept" then
                        if getGuildWarInfo(myGuild).By ~= 0 then
                                local enemyGuild = getGuildWarInfo(myGuild).By
                                doBroadcastMessage(BroadCast[2][1] ..getPlayerGuildName(cid).. BroadCast[2][2] ..getGuildNameById(enemyGuild).. BroadCast[2][3], BroadCast_Type)
                                WarAccept(myGuild, enemyGuild)
                        else
                                doPlayerSendCancel(cid, CancelMessagesWar[1])
                        end
                elseif words == "/war-reject" then
                        if getGuildWarInfo(myGuild).By ~= 0 then
                                doBroadcastMessage(BroadCast[3][1] ..getPlayerGuildName(cid).. BroadCast[3][2] ..getGuildNameById(getGuildWarInfo(myGuild).By).. BroadCast[3][3], BroadCast_Type)
                                cleanInfo(getGuildWarInfo(myGuild).By)
                                cleanInfo(myGuild)
                        else
                                doPlayerSendCancel(cid, CancelMessagesWar[1])  
                        end
                elseif words == "/war-cancel-invite" then
                        if getGuildWarInfo(myGuild).To ~= 0 then
                                if getGuildWarInfo(myGuild).With == 0 then
                                        doBroadcastMessage(BroadCast[4][1] ..getPlayerGuildName(cid).. BroadCast[4][2] ..getGuildNameById(getGuildWarInfo(myGuild).To).. BroadCast[4][3], BroadCast_Type)
                                        cleanInfo(getGuildWarInfo(myGuild).To)
                                        cleanInfo(myGuild)
                                else
                                        doPlayerSendCancel(cid, CancelMessagesWar[3])
                                end
                        else
                                doPlayerSendCancel(cid, CancelMessagesWar[1])  
                        end
                elseif words == "/war-challenge" then
                        local map = Maps[param]
                        if map then
                                if enemy ~= 0 then
                                        local enemyGuild = getGuildWarInfo(myGuild).With
                                        addEvent(StartWar, 15000, {myGuild = myGuild, enemyGuild = enemyGuild, map = param})
                                        doBroadcastMessage(BroadCast[5][1] ..getPlayerGuildName(cid).. BroadCast[5][2] ..getGuildNameById(enemyGuild).. BroadCast[5][3] .. param ..".", BroadCast_Type)
                                else
                                        doPlayerSendCancel(cid, CancelMessagesWar[10])
                                end
                        else
                                doPlayerSendCancel(cid, CancelMessagesWar[9])
                        end
                elseif words == "/war-cancel" then
                        local enemy = getGuildWarInfo(myGuild).With
                        if enemy ~= 0 then
                                if (os.time() - getGuildWarInfo(myGuild).T) >= (60 * 60 * DelayToCancel) then
                                        StopWar(myGuild, enemy)
                                        doBroadcastMessage(BroadCast[6][1] ..getGuildNameById(myGuild).. BroadCast[6][2] ..getGuildNameById(enemy).. BroadCast[6][3], BroadCast_Type)
                                else
                    local timeEnd = getGuildWarInfo(myGuild).T + (60 * 60 * DelayToCancel)
                    local timeLeft = timeEnd - os.time()
                    local hours = (os.date("%H", timeLeft) + 23)
                                        doPlayerSendCancel(cid, "Time remaining: "..hours.." hours, " .. os.date("%M", timeLeft) .. " minutes and " .. os.date("%S", timeLeft) .. " seconds.")
                                end
                        else
                                doPlayerSendCancel(cid, CancelMessagesWar[10])
                        end
                elseif words == "!disband" then
                        local enemy = getGuildWarInfo(myGuild).With
                        if enemy > 0 then
                if channel == CHANNEL_GUILD then
                    if (os.time() - getGuildWarInfo(myGuild).T) >= (60 * 60 * DelayToCancel) then
                                            StopWar(myGuild, enemy)
                                            doBroadcastMessage(BroadCast[6][1] ..getGuildNameById(myGuild).. BroadCast[6][2] ..getGuildNameById(enemy).. BroadCast[6][3], BroadCast_Type)
                                    else
                    local timeEnd = getGuildWarInfo(myGuild).T + (60 * 60 * DelayToCancel)
                    local timeLeft = timeEnd - os.time()
                    local hours = (os.date("%H", timeLeft) + 23)
                                        doPlayerSendCancel(cid, "Time remaining: "..hours.." hours, " .. os.date("%M", timeLeft) .. " minutes and " .. os.date("%S", timeLeft) .. " seconds.")
                                    end
                            else
                    doPlayerSendCancel(cid, "You have to say this command in your guild channel.")
                            end
            else
                                return FALSE
            end
                                return FALSE
                end
        else
                doPlayerSendCancel(cid, CancelMessagesWar[2])
        end
        local file = io.open("data/logs/Wars.txt", "a")
        file:write("".. os.date("%d %B %Y %X ", os.time()) .." -->  "..getCreatureName(cid)..": "..words.." "..param.."\n")
        file:close()
        return TRUE
end]]></talkaction>
 
<event type="login" name="WarLogin" event="script"><![CDATA[
domodlib('function_config')
function onLogin(cid)
        registerCreatureEvent(cid, "WarKill")
        return true
end]]></event>
 
<event type="kill" name="WarKill" event="script"><![CDATA[
domodlib('function_config')
 
local PZ = createConditionObject(CONDITION_INFIGHT)
setConditionParam(PZ, CONDITION_PARAM_TICKS, getConfigInfo('whiteSkullTime'))
 
function onKill(cid, target, lastHit)
 
        if isPlayer(cid) == TRUE and isPlayer(target) == TRUE then
 
local config = {
                removeFrags = true -- If 'true' player won't gain frags from a player that is versus him; else, player will gain frags as normal.
                }
 
        local GUID = getPlayerGUID(cid)
        local namec = getPlayerName(cid)
        local namet = getPlayerName(target)
        local skull = getCreatureSkullType(cid)
        local skullend = getPlayerSkullEnd(cid)
    local playerPos = getPlayerPosition(cid)
    local targetPos = getPlayerPosition(target)
        local cidd = cid
 
        local timeA = os.time()
        local timesA = {today = (timeA - 86400), week = (timeA - (7 * 86400))}
 
        local contentsA, resultA = {day = {}, week = {}, month = {}}, db.getResult("SELECT `pd`.`date`, `pd`.`level`, `p`.`name` FROM `player_killers` pk LEFT JOIN `killers` k ON `pk`.`kill_id` = `k`.`id` LEFT JOIN `player_deaths` pd ON `k`.`death_id` = `pd`.`id` LEFT JOIN `players` p ON `pd`.`player_id` = `p`.`id` WHERE `pk`.`player_id` = " .. getPlayerGUID(cid) .. " AND `k`.`unjustified` = 1 AND `pd`.`date` >= " .. (timeA - (30 * 86400)) .. " ORDER BY `pd`.`date` DESC")
        if(resultA:getID() ~= -1) then
                repeat
                        local contentA = {
                                name = resultA:getDataString("name"),
                                level = resultA:getDataInt("level"),
                                date = resultA:getDataInt("date")
                        }
                        if(contentA.date > timesA.today) then
                                table.insert(contentsA.day, contentA)
                        elseif(contentA.date > timesA.week) then
                                table.insert(contentsA.week, contentA)
                        else
                                table.insert(contentsA.month, contentA)
                        end
                until not resultA:next()
                resultA:free()
        end
 
        local sizeA = {
                day = table.maxn(contentsA.day),
                week = table.maxn(contentsA.week),
                month = table.maxn(contentsA.month)
        }
local function removeFrag(cid)
 
        local timeB = os.time()
        local timesB = {today = (timeB - 86400), week = (timeB - (7 * 86400))}
 
        local contentsB, resultB = {day = {}, week = {}, month = {}}, db.getResult("SELECT `pd`.`date`, `pd`.`level`, `p`.`name` FROM `player_killers` pk LEFT JOIN `killers` k ON `pk`.`kill_id` = `k`.`id` LEFT JOIN `player_deaths` pd ON `k`.`death_id` = `pd`.`id` LEFT JOIN `players` p ON `pd`.`player_id` = `p`.`id` WHERE `pk`.`player_id` = " .. GUID .. " AND `k`.`unjustified` = 1 AND `pd`.`date` >= " .. (timeB - (30 * 86400)) .. " ORDER BY `pd`.`date` DESC")
        if(resultB:getID() ~= -1) then
                repeat
                        local contentB = {
                                name = resultB:getDataString("name"),
                                level = resultB:getDataInt("level"),
                                date = resultB:getDataInt("date")
                        }
                        if(contentB.date > timesB.today) then
                                table.insert(contentsB.day, contentB)
                        elseif(contentB.date > timesB.week) then
                                table.insert(contentsB.week, contentB)
                        else
                                table.insert(contentsB.month, contentB)
                        end
                until not resultB:next()
                resultB:free()
        end
 
        local sizeB = {
                day = table.maxn(contentsB.day),
                week = table.maxn(contentsB.week),
                month = table.maxn(contentsB.month)
        }
 
 
if sizeB.day > sizeA.day or sizeB.week > sizeA.week or sizeB.month > sizeA.month then
        db.executeQuery("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = "..GUID..") ORDER BY `death_id` DESC LIMIT 1;")
        doPlayerSendTextMessage(cidd, 21, "Frag from "..namet.." wasn't counted.")
end
 
if skull == SKULL_RED then
        if getCreatureSkullType(cidd) == SKULL_BLACK then
                doPlayerSetSkullEnd(cidd, skullend, SKULL_RED)
                doCreatureSetSkullType(cidd, SKULL_RED)
        end
elseif skull == SKULL_WHITE then
        if getCreatureSkullType(cidd) == SKULL_RED then
                doPlayerSetSkullEnd(cidd, timeB, SKULL_RED)
                doCreatureSetSkullType(cidd, SKULL_WHITE)
        end
end
 
end
 
                local myGuild = getPlayerGuildId(cid)
                local enemyGuild = getPlayerGuildId(target)
 
                if myGuild ~= 0 and enemyGuild ~= 0 then
                        if enemyGuild == getGuildWarInfo(myGuild).With then
local guildc = getPlayerGuildName(cid)
local guildt = getPlayerGuildName(target)
                                doAddCondition(cid, PZ)
 
                                if lastHit == TRUE then
                    if getTileZoneInfo(playerPos) == 0 and getTileZoneInfo(targetPos) == 0 then
                                            if getShowInfo(myGuild) == 1 then
                                                    registerDeathOne(myGuild, enemyGuild, cid, target)
                                            else
                                                    registerDeathTwo(myGuild, enemyGuild, cid, target)
                                            end    
                    else
                        doPlayerSendTextMessage(cid, 19, "Remember: in PvP zone the system doesn't register the frag.")
                    end
                                end
 
                                if config.removeFrags == true then
                                        addEvent(removeFrag, 150)
                                end
 
local gsim = getShowInfo(myGuild)
local gsie = getShowInfo(enemyGuild)
 
if gsim > gsie then
    resulta = getKills(guildc)
    resultb = getKills(guildt)
else
    resulta = getKills(guildt)
    resultb = getKills(guildc)
end
 
local players = getOnlinePlayers()
    for i,playerName in ipairs(players) do
        local player = getPlayerByName(playerName);
        if getPlayerGuildId(player) == myGuild then
    if getTileZoneInfo(playerPos) == 0 and getTileZoneInfo(targetPos) == 0 then
            doPlayerSendChannelMessage(player, "", "Opponent "..namet.." of the "..guildt.." was killed by "..namec..". The new score is "..resulta..":"..resultb.." frags.", TALKTYPE_CHANNEL_W, CHANNEL_GUILD)
    end
        end
    end
                        end
                end
        end
        return TRUE
end]]></event>
</mod>