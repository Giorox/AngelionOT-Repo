function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
local actionid = {first=189,second=190}
	if isPlayer(cid) == TRUE then
		local constants = {getPlayerLevel(cid),getCreatureSpeed(cid)} -- don't change
		local config = {from={x=33231,y=31759,z=2,id=actionid.first},to={  x=33231,y=31763,z=2,id=actionid.second}} --enter the position where to jump(to) and back(from)
		local formula = 220+(2*(tonumber(constants[1])-1)) --don't change
		if formula < constants[2] then
			if (config.from.x == config.to.x or config.from.y == config.to.y) and config.from.z == config.to.z then
				if item.actionid == config.from.id then
					doTeleportThing(cid,config.to)
				else
					doTeleportThing(cid,config.from)					
				end
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"Yo  u jumped over the gap.")
				if config.from.x == config.to.x then
					for a = config.from.x,config.to.x do
						for b = config.from.y+1,config.to.y-1 do
							doSendMagicEffect({x=a,y=b,z=config.to.z},2)
						end
					end
				else
					for a = config.from.x+1,config.to.x-1 do
						for b = config.from.y,config.to.y do
							doSendMagicEffect({x=a,y=b,z=config.to.z},2)
						end
					end
				end
			else
				doPlayerSay(cid,"Something is wrong with the positions.They must be on the same floor and the need to be on 1 line.",1)
			end
		else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"Yo  u didn't dare to jump.")
			doTeleportThing(cid, fromPosition, false)
			doSendMagicEffect(fromPosition,2)
		end
	end
	return true
end