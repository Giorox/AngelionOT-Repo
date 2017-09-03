function onSay(cid, words, param)
dofile("./config.lua")
local players = 20 -- The amount of players that is shown in the list
local maxgroupid = 1 -- Players in groups above this is not shown in the list

if sqlType == "mysql" then
env = assert(luasql.mysql())
con = assert(env:connect(mysqlDatabase, mysqlUser, mysqlPass, mysqlHost, mysqlPort))
else -- sqlite
env = assert(luasql.sqlite3())
con = assert(env:connect(sqliteDatabase))
end

local str = ""
if param == "level" or param == "exp" or param == "lvl" or param == "" then
cur = assert(con:execute("SELECT `name`, `level`, `experience` FROM `players` WHERE `group_id` <= "..maxgroupid.." ORDER BY `experience` DESC LIMIT 0,"..players..";"))
row = cur:fetch({}, "a")
str = "# [Level] - Name - (Experience)\n"
local i = 0
while row do
str = str.."\n#"..(i+1).." ["..row.level.."] - "..row.name.." - ("..row.experience..")"
row = cur:fetch (row, "a")
i = i+1
end
elseif param == "maglevel" or param == "magic" or param == "ml" then
cur = assert(con:execute("SELECT `name`, `maglevel` FROM `players` WHERE `group_id` <= "..maxgroupid.." ORDER BY `maglevel` DESC LIMIT 0,"..players..";"))
row = cur:fetch({}, "a")
str = "# [Magic Level] - Name\n"
local i = 0
while row do
str = str.."\n#"..(i+1).." ["..row.maglevel.."] - "..row.name..""
row = cur:fetch (row, "a")
i = i+1
end
elseif param == "fist" then
cur = assert(con:execute("SELECT `player_id`, `value` FROM `player_skills` WHERE `skillid` = 0 ORDER BY `value` DESC;"))
row = cur:fetch({}, "a")
str = "# [Fist Fighting] - Name\n"
local i = 0
while row do
if i == players then
break
end
query = assert(con:execute("SELECT `name` FROM `players` WHERE `group_id` <= "..maxgroupid.." AND `id` = "..row.player_id..""))
sql = query:fetch({}, "a")
if sql ~= nil then
str = str.."\n#"..(i+1).." ["..row.value.."] - "..sql.name..""
i = i+1
end
row = cur:fetch (row, "a")
end
elseif param == "club" then
cur = assert(con:execute("SELECT `player_id`, `value` FROM `player_skills` WHERE `skillid` = 1 ORDER BY `value` DESC;"))
row = cur:fetch({}, "a")
str = "# [Club Fighting] - Name\n"
local i = 0
while row do
if i == players then
break
end
query = assert(con:execute("SELECT `name` FROM `players` WHERE `group_id` <= "..maxgroupid.." AND `id` = "..row.player_id..""))
sql = query:fetch({}, "a")
if sql ~= nil then
str = str.."\n#"..(i+1).." ["..row.value.."] - "..sql.name..""
i = i+1
end
row = cur:fetch (row, "a")
end
elseif param == "sword" then
cur = assert(con:execute("SELECT `player_id`, `value` FROM `player_skills` WHERE `skillid` = 2 ORDER BY `value` DESC;"))
row = cur:fetch({}, "a")
str = "# [Sword Fighting] - Name\n"
local i = 0
while row do
if i == players then
break
end
query = assert(con:execute("SELECT `name` FROM `players` WHERE `group_id` <= "..maxgroupid.." AND `id` = "..row.player_id..""))
sql = query:fetch({}, "a")
if sql ~= nil then
str = str.."\n#"..(i+1).." ["..row.value.."] - "..sql.name..""
i = i+1
end
row = cur:fetch (row, "a")
end
elseif param == "axe" then
cur = assert(con:execute("SELECT `player_id`, `value` FROM `player_skills` WHERE `skillid` = 3 ORDER BY `value` DESC;"))
row = cur:fetch({}, "a")
str = "# [Axe Fighting] - Name\n"
local i = 0
while row do
if i == players then
break
end
query = assert(con:execute("SELECT `name` FROM `players` WHERE `group_id` <= "..maxgroupid.." AND `id` = "..row.player_id..""))
sql = query:fetch({}, "a")
if sql ~= nil then
str = str.."\n#"..(i+1).." ["..row.value.."] - "..sql.name..""
i = i+1
end
row = cur:fetch (row, "a")
end
elseif param == "dist" or param == "distance" then
cur = assert(con:execute("SELECT `player_id`, `value` FROM `player_skills` WHERE `skillid` = 4 ORDER BY `value` DESC;"))
row = cur:fetch({}, "a")
str = "# [Distance Fighting] - Name\n"
local i = 0
while row do
if i == players then
break
end
query = assert(con:execute("SELECT `name` FROM `players` WHERE `group_id` <= "..maxgroupid.." AND `id` = "..row.player_id..""))
sql = query:fetch({}, "a")
if sql ~= nil then
str = str.."\n#"..(i+1).." ["..row.value.."] - "..sql.name..""
i = i+1
end
row = cur:fetch (row, "a")
end
elseif param == "shield" or param == "shielding" then
cur = assert(con:execute("SELECT `player_id`, `value` FROM `player_skills` WHERE `skillid` = 5 ORDER BY `value` DESC;"))
row = cur:fetch({}, "a")
str = "# [Shielding] - Name\n"
local i = 0
while row do
if i == players then
break
end
query = assert(con:execute("SELECT `name` FROM `players` WHERE `group_id` <= "..maxgroupid.." AND `id` = "..row.player_id..""))
sql = query:fetch({}, "a")
if sql ~= nil then
str = str.."\n#"..(i+1).." ["..row.value.."] - "..sql.name..""
i = i+1
end
row = cur:fetch (row, "a")
end
elseif param == "fish" or param == "fishing" then
cur = assert(con:execute("SELECT `player_id`, `value` FROM `player_skills` WHERE `skillid` = 6 ORDER BY `value` DESC;"))
row = cur:fetch({}, "a")
str = "# [Fishing] - Name\n"
local i = 0
while row do
if i == players then
break
end
query = assert(con:execute("SELECT `name` FROM `players` WHERE `group_id` <= "..maxgroupid.." AND `id` = "..row.player_id..""))
sql = query:fetch({}, "a")
if sql ~= nil then
str = str.."\n#"..(i+1).." ["..row.value.."] - "..sql.name..""
i = i+1
end
row = cur:fetch (row, "a")
end
end
if str ~= "" then
doPlayerPopupFYI(cid, str)
end
con:close()
env:close()
end