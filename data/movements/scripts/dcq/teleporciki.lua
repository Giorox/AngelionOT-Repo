function onStepIn(cid, item, pos)

local thais = {x=32915, y=32263, z=14}
local kurwa = {x=32946, y=32270, z=13}
local kuzwa = {x=32976, y=32270, z=14}
local kita = {x=32934, y=32282, z=13}
local nao = {x=32753, y=32344, z=14}

    if item.actionid == 37601 then
		doTeleportThing(cid,thais)
		else
	if item.actionid == 37602 then
		doTeleportThing(cid,kurwa)
		else
	if item.actionid == 37603 then
		doTeleportThing(cid,kuzwa)
		else
	if item.actionid == 37604 then
		doTeleportThing(cid,kita)
		else
	if item.actionid == 37605 then
		doTeleportThing(cid,nao)
		doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Congratulations, you have passed the Dream Challenge. Now enjoy the fruits of your succes and relax before you can continue the way to meet the master.")
		setPlayerStorageValue(cid,32700,1)
        end
    return 1
end 
end
end
end
end