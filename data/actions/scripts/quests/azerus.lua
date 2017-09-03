local BlindField = {x=32781, y=31157, z=10, stackpos=1} 
 
function mapArea(fromPos, toPos, stack) 
        local pos = {x=fromPos.x, y=fromPos.y-1, z=fromPos.z} 
        return function() 
                if (pos.y < toPos.y) then 
                        pos.y = pos.y+1 
                elseif (pos.x <= toPos.x) then 
                        pos.y = fromPos.y 
                        pos.x = pos.x+1 
                else 
                        pos.x = fromPos.x 
                        pos.y = fromPos.y 
                        pos.z = pos.z+1 
                end 
                if (pos.x <= toPos.x and pos.y <= toPos.y or pos.z < toPos.z) then 
                        if (stack == nil) then 
                                return pos 
                        else 
                                pos.stackpos = stack  
                                return pos, getThingfromPos(pos) 
                        end 
                end 
        end 
end 


function getMonstersfromArea(fromPos, toPos) 
        local monsters = {}     
        for _, thing in mapArea(fromPos, toPos, 253) do 
                if isMonster(thing.uid) == TRUE then 
                        table.insert(monsters, thing.uid) 
            end 

        end 
          local bfm = getThingfromPos(BlindField) 
            if isMonster(bfm.uid) == TRUE then 
            table.insert(monsters, bfm.uid) 
            end 
        return monsters 
end 


function onUse(cid, item, fromPosition, itemEx, toPosition) 
	local topLeft = {x=32776, y=31159, z=10} 
	local buttomRight = {x=32790, y=31176, z=10} 
	local monsters = getMonstersfromArea(topLeft, buttomRight) 
	local monsters1 = getMonstersfromArea(topLeft, buttomRight) 
	local tp = {x=32783, y=31175, z=10} 
	local glo = {x=32783, y=31166, z=10} 

	local function FirstWave() 
		doSummonCreature("Rift Worm", {x= glo.x - 4,y=glo.y,z=glo.z}) 
		doSummonCreature("Rift Worm", {x= glo.x + 4,y=glo.y,z=glo.z}) 
		doSummonCreature("Rift Worm", {x=glo.x,y=glo.y + 4,z=glo.z}) 
		doSummonCreature("Rift Worm", {x=glo.x,y=glo.y - 4,z=glo.z}) 
		doSummonCreature("Rift Worm", {x=glo.x,y=glo.y + 5,z=glo.z}) 
		doSummonCreature("Azerus", {x=glo.x,y=glo.y - 5,z=glo.z}) 
	end 
	local function FifthWave() 
		doSummonCreature("Rift Worm", {x= glo.x - 4,y=glo.y,z=glo.z}) 
		doSummonCreature("Rift Worm", {x= glo.x + 4,y=glo.y,z=glo.z}) 
		doSummonCreature("Rift Worm", {x=glo.x,y=glo.y + 4,z=glo.z}) 
		doSummonCreature("Rift Worm", {x=glo.x,y=glo.y - 4,z=glo.z}) 
		doSummonCreature("Rift Worm", {x=glo.x,y=glo.y + 5,z=glo.z}) 
	end 

	local function SecondWave() 
		local monsters1 = getMonstersfromArea(topLeft, buttomRight) 
		for _, monster in pairs(monsters1) do 
			if getCreatureName(monster) == "Azerus" then 
				doRemoveCreature(monster) 
			end 
		end 
		
		doSummonCreature("Azerus1", {x=glo.x,y=glo.y - 5,z=glo.z}) 
		doSummonCreature("Rift Brood", {x= glo.x - 4,y=glo.y,z=glo.z}) 
		doSummonCreature("Rift Brood", {x= glo.x + 4,y=glo.y,z=glo.z}) 
		doSummonCreature("Rift Brood", {x=glo.x,y=glo.y + 4,z=glo.z}) 
		doSummonCreature("Rift Brood", {x=glo.x,y=glo.y - 4,z=glo.z}) 
		doSummonCreature("Rift Brood", {x=glo.x,y=glo.y + 5,z=glo.z}) 
	end 
	local function SixthWave() 
		doSummonCreature("Rift Brood", {x= glo.x - 4,y=glo.y,z=glo.z}) 
		doSummonCreature("Rift Brood", {x= glo.x + 4,y=glo.y,z=glo.z}) 
		doSummonCreature("Rift Brood", {x=glo.x,y=glo.y + 4,z=glo.z}) 
		doSummonCreature("Rift Brood", {x=glo.x,y=glo.y - 4,z=glo.z}) 
		doSummonCreature("Rift Brood", {x=glo.x,y=glo.y + 5,z=glo.z}) 
	end
	
	local function ThirdWave() 
		local monsters1 = getMonstersfromArea(topLeft, buttomRight) 

		for _, monster in pairs(monsters1) do 
			if getCreatureName(monster) == "Azerus" then 
				doRemoveCreature(monster) 
			end 
		end 
		doSummonCreature("Azerus2", {x= glo.x - 5,y=glo.y,z=glo.z}) 
		doSummonCreature("Rift Scythe", {x= glo.x - 4,y=glo.y,z=glo.z}) 
		doSummonCreature("Rift Scythe", {x= glo.x + 4,y=glo.y,z=glo.z}) 
		doSummonCreature("Rift Scythe", {x= glo.x + 4,y=glo.y,z=glo.z}) 
		doSummonCreature("Rift Scythe", {x=glo.x,y=glo.y + 4,z=glo.z}) 
	end 

	local function ThirdWave1() --  with 2s delay 
		doSummonCreature("Rift Scythe", {x=glo.x,y=glo.y + 4,z=glo.z}) 
		doSummonCreature("Rift Scythe", {x=glo.x,y=glo.y - 4,z=glo.z}) 
		doSummonCreature("Rift Scythe", {x=glo.x,y=glo.y + 5,z=glo.z}) 
	end 

	local function FourthWave() 
		doSummonCreature("War Golem", {x= glo.x - 4,y=glo.y,z=glo.z}) 
		doSummonCreature("War Golem", {x= glo.x + 4,y=glo.y,z=glo.z}) 
		doSummonCreature("War Golem", {x=glo.x,y=glo.y - 4,z=glo.z}) 
		doSummonCreature("War Golem", {x=glo.x,y=glo.y + 4,z=glo.z}) 
	end 

	local function SevenWave() 
		local monsters1 = getMonstersfromArea(topLeft, buttomRight) 
		for _, monster in pairs(monsters1) do 
			if getCreatureName(monster) == "Azerus" then 
				doRemoveCreature(monster) 
			end 
		end 
		
		doSummonCreature("Azerus3", {x= glo.x - 5,y=glo.y,z=glo.z}) 
		doSummonCreature("War Golem", {x= glo.x - 4,y=glo.y,z=glo.z}) 
		doSummonCreature("War Golem", {x= glo.x + 4,y=glo.y,z=glo.z}) 
		doSummonCreature("War Golem", {x=glo.x,y=glo.y - 4,z=glo.z}) 
		doSummonCreature("War Golem", {x=glo.x,y=glo.y + 4,z=glo.z}) 
	end 

	local function Glllobe()
		local monst = getMonstersfromArea(topLeft, buttomRight) 
		for i = 1, #monst do
			doRemoveCreature(monst[i])

		end

		local item1 = getTileItemById(glo, 9767)
		doItemSetAttribute(item1.uid, "aid", 58261)
	end

	local function createWall(p)
		local janek = doCreateItem(1387,1,{x=32784, y=31177, z=9})
		doItemSetAttribute(janek, "aid", 9105)
	end

	local function createWalll(i)
		local ela = doCreateItem(1387,1,{x=32783, y=31175, z=10})
		doItemSetAttribute(ela, "aid", 9106)
	end
	
	local wall0 = {x=32784, y=31177, z=9, stackpos=1}
	local getwall0 = getThingfromPos(wall0)
	local wall1 = {x=32783, y=31175, z=10, stackpos=1}
	local getwall1 = getThingfromPos(wall1)
	local monsters = getMonstersfromArea(topLeft, buttomRight) 
	local monsters1 = getMonstersfromArea(topLeft, buttomRight) 
	local tele_chk = getTileItemById(tp, 1387)
	if item.actionid == 58261 then
		doItemSetAttribute(item.uid, "aid", 58263)
	end

	if tele_chk.uid > 0 then 
		doRemoveItem(getTileItemById(tp,1387).uid) 
		doRemoveItem(getwall0.uid,1)
		addEvent(FirstWave, 0) 
		addEvent(FifthWave, 30000)
		addEvent(SecondWave, 60000) 
		addEvent(SixthWave, 90000) 
		addEvent(ThirdWave, 120000) 
		addEvent(ThirdWave1, 150000) 
		addEvent(FourthWave, 180000) 
		addEvent(SevenWave, 210000) 
		addEvent(Glllobe, 400000)  
		p = {wallid = getwall0.itemid}
		addEvent(createWall, 300*1000, p)
		i = {wallid = getwall1.itemid}
		addEvent(createWalll, 300*1000, i)
	end
	
	if item.actionid == 58263 then 
		doCreatureSay(cid, "You have to wait some time before this globe will charge.", TALKTYPE_ORANGE_1)
	end
	return TRUE 
end