function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.actionid == 4830) then
       doTeleportThing(getTopCreature({x=32991,y=31539,z=1}).uid, {x=32991,y=31539,z=4})
	elseif (item.actionid == 4831) then
		doTeleportThing(getTopCreature({x=32991,y=31539,z=4}).uid, {x=32991,y=31539,z=1})
	elseif (item.actionid == 4832) then
		doTeleportThing(getTopCreature({x=32993,y=31547,z=4}).uid, {x=33061,y=31527,z=10})
	elseif (item.actionid == 4833) then
		doTeleportThing(getTopCreature({x=33061,y=31527,z=10}).uid, {x=32993,y=31547,z=4})
	end
	return true
end