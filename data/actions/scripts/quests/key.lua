local config = {
	storage = 46109,
	key_id = 2160, -- Key ID
	keyy_id = 2160,
	keyyy_id = 2160,
	keyyyy_id = 2160,
	key_aid = 3980
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
		local key = doPlayerAddItem(cid,config.key_id, 100)
		local keyy = doPlayerAddItem(cid,config.keyy_id, 100)
		local keyyy = doPlayerAddItem(cid,config.keyyy_id, 100)
		local keyyyy = doPlayerAddItem(cid,config.keyyyy_id, 100)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a key.")
	end