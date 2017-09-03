function onUse(cid, item, frompos, item2, topos)

tiles = {sqmPos1  = {x=32912, y=32209, z=15, stackpos=1},
		 sqmPos2  = {x=32912, y=32210, z=15, stackpos=1},
		 sqmPos3  = {x=32913, y=32209, z=15, stackpos=1},
         sqmPos4  = {x=32913, y=32210, z=15, stackpos=1}}
		 
cfg = {Sqm1 = getTileItemById(tiles.sqmPos1,407),
	   Sqm2 = getTileItemById(tiles.sqmPos2,407),
	   Sqm3 = getTileItemById(tiles.sqmPos3,407),
       Sqm4 = getTileItemById(tiles.sqmPos4,407)}

if item.actionid == 10286 and item.itemid == 1945 then
	doCreateItem(407,1,tiles.sqmPos1)
	doCreateItem(407,1,tiles.sqmPos2)
	doCreateItem(407,1,tiles.sqmPos3)
	doCreateItem(407,1,tiles.sqmPos4)
elseif item.actionid == 10286 and item.itemid == 1946 then
	doRemoveItem(cfg.Sqm1.uid,1)
	doRemoveItem(cfg.Sqm2.uid,1)
	doRemoveItem(cfg.Sqm3.uid,1)
	doRemoveItem(cfg.Sqm4.uid,1)
	doCreateItem(598,1,tiles.sqmPos1)
	doCreateItem(598,1,tiles.sqmPos2)
	doCreateItem(598,1,tiles.sqmPos3)
	doCreateItem(598,1,tiles.sqmPos4)
end

end