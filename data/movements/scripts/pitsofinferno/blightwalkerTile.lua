local bridgePos = {x=32851, y=32309, z=11}

function onStepIn(cid, item, pos)
	doCreateItem(5770,1,bridgePos)
end

function onStepOut(cid, item, pos)
	doRemoveItem(getThingfromPos(bridgePos).uid, 1)
end