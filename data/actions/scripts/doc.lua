local config = {
	small_diamond_id = 2145,
	documents = {7844, 7845, 7846},  -- follower, officer, leader
}
local levers = {
	[15051] = {pos = {x=32784,y=32229,z=14}, item = config.documents[1]},
	[15052] = {pos = {x=32782,y=32225,z=14}, item = config.documents[2]},
	[15053] = {pos = {x=32785,y=32223,z=14}, item = config.documents[3]},
	
	[15061] = {pos = {x=32836,y=32228,z=14}, item = config.documents[1]},
	[15062] = {pos = {x=32834,y=32224,z=14}, item = config.documents[2]},
	[15063] = {pos = {x=32837,y=32222,z=14}, item = config.documents[3]}
		}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 1945) then
		local diam = getTileItemById(levers[item.actionid].pos,config.small_diamond_id);
		if(diam.itemid < 10) then
			doPlayerSendCancel(cid, "You have to place a diamonc in order to use it.");
			return true;
		end
		
		doRemoveItem(diam.uid,1);
		doCreateItem(levers[item.actionid].item,1,levers[item.actionid].pos);
	end
	doTransformItem(item.uid,item.itemid==1945 and 1946 or 1945);
	return true;
end