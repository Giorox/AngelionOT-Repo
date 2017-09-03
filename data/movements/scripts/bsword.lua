
local function createTree(p)

doCreateItem(1304,1,{x=32614, y=32206, z=10})

end

function onAddItem(moveitem, tileitem, pos)

tree1pos = {x=32614, y=32206, z=10, stackpos=1} -- postion tree 1
tree1 = getThingfromPos(tree1pos)

if (moveitem.itemid == 1774) then
	doRemoveItem(moveitem.uid,1)
	doSendMagicEffect(pos,2)

	doRemoveItem(tree1.uid,1)

	doSendMagicEffect(tree1pos,7)
	p = {treeid = tree1.itemid}
	addEvent(createTree, 600*1000, p)

else
end
return 1
end