
local function createTree(p)

doCreateItem(2722,1,{x=32857, y=32231, z=11})
doCreateItem(2722,1,{x=32857, y=32232, z=11})
doCreateItem(2722,1,{x=32857, y=32233, z=11})

end

function onAddItem(moveitem, tileitem, pos)

tree1pos = {x=32857, y=32231, z=11, stackpos=1} -- postion tree 1
tree2pos = {x=32857, y=32232, z=11, stackpos=1} -- postion tree 2
tree3pos = {x=32857, y=32233, z=11, stackpos=1} -- postion tree 3
tree1 = getThingfromPos(tree1pos)
tree2 = getThingfromPos(tree2pos)
tree3 = getThingfromPos(tree3pos)

if (moveitem.itemid == 6300 or moveitem.itemid == 6301) then
	doRemoveItem(moveitem.uid,1)
	doSendMagicEffect(pos,2)

	doRemoveItem(tree1.uid,1)
	doRemoveItem(tree2.uid,1)
	doRemoveItem(tree3.uid,1)

	doSendMagicEffect(tree1pos,7)
	doSendMagicEffect(tree2pos,7)
	doSendMagicEffect(tree3pos,7)
	p = {treeid = tree1.itemid}
	addEvent(createTree, 15*1000, p)

else
end
return 1
end