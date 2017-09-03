local firstItems = {}
firstItems[0] =
{
3057,
3425,
3270,
3007,
3353,
3557,
3552
}
firstItems[1] =
{
3057,
3425,
3074,
3007,
3353,
3557,
3552
}
firstItems[2] =
{
3057,
3425,
3066,
3007,
3353,
3557,
3552
}
firstItems[3] =
{
3057,
3425,
3277,
3007,
3353,
3557,
3552
}
firstItems[4] =
{
3057,
3425,
3283,
3007,
3353,
3557,
3552
}

function onLogin(cid)
if getPlayerStorageValue(cid, 30001) == -1 then
for i = 1, table.maxn(firstItems[getPlayerVocation(cid)]) do
doPlayerAddItem(cid, firstItems[getPlayerVocation(cid)][i], 1)
end
if getPlayerSex(cid) == 0 then
doPlayerAddItem(cid, 2463, 1)
else
doPlayerAddItem(cid, 2463, 1)
end
local bag = doPlayerAddItem(cid, 2854, 1)
doAddContainerItem(bag, 2854, 4)
setPlayerStorageValue(cid, 30001, 1)
end
return TRUE
end

