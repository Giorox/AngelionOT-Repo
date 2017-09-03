local cfg = {
	playerStorage = 60999,
	globalStorage = 60999,
	minutes = 30,
	positions = {
		{x=33060, y=31623, z=15},
		{x=33066, y=31623, z=15},
		{x=33060, y=31627, z=15},
		{x=33066, y=31627, z=15}
	},
	bagItems = {
		{2165}, {2151, 2}, {2230}, {2229}, {1951}
	}
}
function onUse(cid, item, frompos, item2, topos)
	if getGlobalStorageValue(cfg.globalStorage) < 1 and getPlayerStorageValue(cid, cfg.playerStorage) < 1 then
		for _, t in pairs(cfg.positions) do
			doSummonCreature("Demon", t)
		end
		local bag = doPlayerAddItem(cid, 1987, 1)
		for _, t in pairs(cfg.bagItems) do
			doAddContainerItem(bag, t[1], t[2] or 1)
		end
		setPlayerStorageValue(cid, cfg.playerStorage, 1)
		setGlobalStorageValue(cfg.globalStorage, 1)
		addEvent(setGlobalStorageValue, cfg.minutes * 60000, 60999, -1)
	end
end