local config = {
	timeLimit = 500, -- in seconds
	
teleport = {
		time = 1000 * 60 * 10, -- time to remove teleport
		
pos = {x = 32614, y = 32482, z = 9}, -- onde ser criado o teleport		
toPos = {x = 32614, y = 32483, z = 9} -- onde o teleport levará
	},

	
switches = { 
6551,
		6552,
		6553,
		6554,
		6555,
		6556
	},

effect = {
		show = "yes",
		text = "Gogogo!",
		magicEffect = 19
	}
}



config.effect.show = getBooleanFromString(config.effect.show)

local switchStates = {}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	
if(item.itemid == 1946) then
		
doTransformItem(item.uid, 1945)
		
table.remove(switchStates, item.uid)
		
return TRUE
	
end

	
if(getTileItemById(config.teleport.pos, 1387).itemid ~= 0) then
		
doPlayerSendCancel(cid, "Teleport is already open!")
		
return TRUE
	
end

	
switchStates[item.uid] = 1
	
if(table.maxn(switchStates) == #config.switches) then
		
if(config.effect.show) then
			
for _, uid in pairs(config.switches) do
				
local pos = getThingPos(uid)
				
doSendMagicEffect(pos, config.effect.magicEffect)
				
doSendAnimatedText(pos, "Gogogo!", cid)
			
end
		
end

		
switchStates = {}
		
doCreateTeleport(1387, config.teleport.toPos, config.teleport.pos)
		
addEvent(autoRemoveTeleport, config.teleport.time)
	
end

	
doTransformItem(item.uid, 1946)
	
return TRUE

end


local function autoRemoveTeleport()
	
local teleport = getTileItemById(config.teleport.pos, 1387).uid
	
if(teleport ~= 0) then
		
doRemoveItem(teleport)
	
end

end
