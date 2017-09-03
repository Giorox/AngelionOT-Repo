local config = 
{	storages = {bb = 15001, nk = 15002},
	documents = {7844, 7845, 7846},  -- follower, officer, leader
	rank = {15003, 15004},
	sstorages = {{15009, 15010}, 15011, 15012},
	outfits = {19,17}
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid,config.storages.bb) < 1 and getPlayerStorageValue(cid,config.storages.nk) < 1) then
		doPlayerSendCancel(cid, "You are not allowed to use this thing.")
		return true;
	end
	if(not isInArray(config.documents, item.itemid)) then
		return true;
	end
	local a = getPlayerStorageValue(cid,config.storages.bb) == 1 and 1 or 2;
	local t=0;
	for i=1,#config.documents do
		if config.documents[i] == item.itemid then
			t = i;
			break;
		end
	end
	if(getPlayerStorageValue(cid,config.rank[a]) < t) then
		doPlayerSendCancel(cid, "You are not allowed to use this thing.")
		return true;
	end
	
	if(t==1) then--noobish way to do it
		if(getPlayerStorageValue(cid, config.sstorages[t][a]) == 1) then
			doPlayerSendCancel(cid, "You have already used this item.")
			return true;
		end
	else
		if(getPlayerStorageValue(cid, config.sstorages[t]) == 1) then
			doPlayerSendCancel(cid, "You have already used this item.")
			return true;
		end
	end
	doPlayerAddOutfitId(cid, config.outfits[a],t-1)
	if(t==1) then
		setPlayerStorageValue(cid,config.sstorages[t][a],1);
	else
		setPlayerStorageValue(cid,config.sstorages[t],1);
	end
	doRemoveItem(item.uid)
	return true
end