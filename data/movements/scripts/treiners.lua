function onStepIn(cid, item, pos)
local charPos = getCreaturePosition(cid)
local monkOne
local monkTwo

if(item.actionid == 9000) then
monkOne = {x = charPos.x + 0, y = charPos.y - 2, z = charPos.z}
monkTwo = {x = charPos.x + 1, y = charPos.y - 2, z = charPos.z}

elseif(item.actionid == 9001) then
monkOne = {x = charPos.x - 1, y = charPos.y + 2, z = charPos.z}
monkTwo = {x = charPos.x + 0, y = charPos.y + 2, z = charPos.z}

elseif(item.actionid == 9002) then
monkOne = {x = charPos.x - 1, y = charPos.y - 2, z = charPos.z}
monkTwo = {x = charPos.x + 0, y = charPos.y - 2, z = charPos.z}

elseif(item.actionid == 9003) then
monkOne = {x = charPos.x + 0, y = charPos.y + 2, z = charPos.z}
monkTwo = {x = charPos.x + 1, y = charPos.y + 2, z = charPos.z}

elseif(item.actionid == 9004) then
monkOne = {x = charPos.x + 2, y = charPos.y - 1, z = charPos.z}
monkTwo = {x = charPos.x + 5, y = charPos.y - 1, z = charPos.z}

else
return true
end

doSummonCreature("Alvo", monkOne)
doSummonCreature("Alvo", monkTwo)
return true
end

function onStepOut(cid, item, pos)
local charPos = getCreaturePosition(cid)
local monkOne
local monkTwo

if(item.actionid == 9000) then
monkOne = {x = charPos.x + 0, y = charPos.y - 2, z = charPos.z}
monkTwo = {x = charPos.x + 1, y = charPos.y - 2, z = charPos.z}

elseif(item.actionid == 9001) then
monkOne = {x = charPos.x - 1, y = charPos.y + 2, z = charPos.z}
monkTwo = {x = charPos.x + 0, y = charPos.y + 2, z = charPos.z}

elseif(item.actionid == 9002) then
monkOne = {x = charPos.x - 1, y = charPos.y - 2, z = charPos.z}
monkTwo = {x = charPos.x + 0, y = charPos.y - 2, z = charPos.z}

elseif(item.actionid == 9003) then
monkOne = {x = charPos.x + 0, y = charPos.y + 2, z = charPos.z}
monkTwo = {x = charPos.x + 1, y = charPos.y + 2, z = charPos.z}

elseif(item.actionid == 9004) then
monkOne = {x = charPos.x + 3, y = charPos.y - 1, z = charPos.z}
monkTwo = {x = charPos.x + 6, y = charPos.y + 0, z = charPos.z}

else
return true
end

doRemoveCreature(getThingfromPos({x = monkOne.x, y = monkOne.y, z = monkOne.z, stackpos = 253}).uid)
doRemoveCreature(getThingfromPos({x = monkTwo.x, y = monkTwo.y, z = monkTwo.z, stackpos = 253}).uid)
doSendMagicEffect(monkOne, 3)
doSendMagicEffect(monkTwo, 3)
return true
end