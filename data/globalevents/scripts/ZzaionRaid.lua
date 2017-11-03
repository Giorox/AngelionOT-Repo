--Zzaion Raid System
--Script by Giorox

local gateID = 9485

local gatePosTable = {
	{x=33303,y=31491,z=7,stackpos=1},
	{x=33304,y=31491,z=7,stackpos=3},
	{x=33305,y=31491,z=7,stackpos=2},
	{x=33306,y=31491,z=7,stackpos=2},
	{x=33307,y=31491,z=7,stackpos=3},
	{x=33308,y=31491,z=7,stackpos=1},
	{x=33309,y=31491,z=7,stackpos=1},
	{x=33303,y=31498,z=7,stackpos=2},
	{x=33304,y=31498,z=7,stackpos=4},
	{x=33305,y=31498,z=7,stackpos=4},
	{x=33306,y=31498,z=7,stackpos=5},
	{x=33307,y=31498,z=7,stackpos=3},
	{x=33308,y=31498,z=7,stackpos=1},
	{x=33309,y=31498,z=7,stackpos=1},
	{x=33310,y=31498,z=7,stackpos=1},
}

local function checkGates() --Return true if gate is closed and false if the gate is open
	for i = 1,15 do
		local gate = getThingfromPos(gatePosTable[1])
        if gate.itemid ~= gateID then
            return false
        end
    end
	return true
end

local function removeGate() -- Function removes all gates

	doRemoveItem(getThingfromPos({x=33303,y=31491,z=7,stackpos=1}).uid,1)
	doRemoveItem(getThingfromPos({x=33304,y=31491,z=7,stackpos=3}).uid,1)
	doRemoveItem(getThingfromPos({x=33305,y=31491,z=7,stackpos=2}).uid,1)
	doRemoveItem(getThingfromPos({x=33306,y=31491,z=7,stackpos=2}).uid,1)
	doRemoveItem(getThingfromPos({x=33307,y=31491,z=7,stackpos=3}).uid,1)
	doRemoveItem(getThingfromPos({x=33308,y=31491,z=7,stackpos=1}).uid,1)
	doRemoveItem(getThingfromPos({x=33309,y=31491,z=7,stackpos=1}).uid,1)
	doRemoveItem(getThingfromPos({x=33303,y=31498,z=7,stackpos=2}).uid,1)
	doRemoveItem(getThingfromPos({x=33304,y=31498,z=7,stackpos=4}).uid,1)
	doRemoveItem(getThingfromPos({x=33305,y=31498,z=7,stackpos=4}).uid,1)
	doRemoveItem(getThingfromPos({x=33306,y=31498,z=7,stackpos=5}).uid,1)
	doRemoveItem(getThingfromPos({x=33307,y=31498,z=7,stackpos=3}).uid,1)
	doRemoveItem(getThingfromPos({x=33308,y=31498,z=7,stackpos=1}).uid,1)
	doRemoveItem(getThingfromPos({x=33309,y=31498,z=7,stackpos=1}).uid,1)
	doRemoveItem(getThingfromPos({x=33310,y=31498,z=7,stackpos=1}).uid,1)
	
	return true
end

local function createGate() --Function adds all gates

	doCreateItem(gateID, 1, {x=33303,y=31491,z=7,stackpos=1})
	doCreateItem(gateID, 1, {x=33304,y=31491,z=7,stackpos=3})
	doCreateItem(gateID, 1, {x=33305,y=31491,z=7,stackpos=2})
	doCreateItem(gateID, 1, {x=33306,y=31491,z=7,stackpos=2})
	doCreateItem(gateID, 1, {x=33307,y=31491,z=7,stackpos=3})
	doCreateItem(gateID, 1, {x=33308,y=31491,z=7,stackpos=1})
	doCreateItem(gateID, 1, {x=33309,y=31491,z=7,stackpos=1})
	doCreateItem(gateID, 1, {x=33303,y=31498,z=7,stackpos=2})
	doCreateItem(gateID, 1, {x=33304,y=31498,z=7,stackpos=4})
	doCreateItem(gateID, 1, {x=33305,y=31498,z=7,stackpos=4})
	doCreateItem(gateID, 1, {x=33306,y=31498,z=7,stackpos=5})
	doCreateItem(gateID, 1, {x=33307,y=31498,z=7,stackpos=3})
	doCreateItem(gateID, 1, {x=33308,y=31498,z=7,stackpos=1})
	doCreateItem(gateID, 1, {x=33309,y=31498,z=7,stackpos=1})
	doCreateItem(gateID, 1, {x=33310,y=31498,z=7,stackpos=1})
	
	return true
end

function onThink(interval)
	if(checkGates() == true) then --If gates are closed, run the sequence to open them
		executeRaid("ZzaionGate")
		addEvent(removeGate,1*1000)
		addEvent(executeRaid,600*1000,"ZzaionBosses")
	else --If gates are open, run sequence to close them
		createGate()
	end
	return true
end
