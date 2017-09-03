local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local Topic, count, transferTo_name = {}, {}, {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function getCount(string)
	local b, e = string:find('%d+')
	return b and e and tonumber(string:sub(b, e)) or -1
end

local function playerExists(name)
	local v, ret = db.getResult("SELECT `name` FROM `players` WHERE `name` = " .. db.escapeString(name) .. ";"), nil
	if v:getID() ~= -1 then
		ret = v:getDataString('name')
	end
	v:free()
	return ret
end

function greetCallback(cid)
	Topic[cid], count[cid], transferTo_name[cid] = 0, 0,0
	return true
end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, 'balance') then
		npcHandler:say('Your account balance is ' .. getPlayerBalance(cid) .. ' gold.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'deposit') and msgcontains(msg, 'all') then
		if getPlayerMoney(cid) > 0 then
			count[cid] = getPlayerMoney(cid)
			npcHandler:say('Would you really like to deposit ' .. count[cid] .. ' gold?', cid)
			Topic[cid] = 2
		else
			npcHandler:say('Please tell me how much gold it is you would like to deposit.', cid)
			Topic[cid] = 1
		end
	elseif msgcontains(msg, 'deposit') then
		if getCount(msg) == 0 then
			npcHandler:say('You are joking, aren\'t you??', cid)
			Topic[cid] = 0
		elseif getCount(msg) ~= -1 then
			if getPlayerMoney(cid) >= getCount(msg) then
				count[cid] = getCount(msg)
				npcHandler:say('Would you really like to deposit ' .. count[cid] .. ' gold?', cid)
				Topic[cid] = 2
			else
				npcHandler:say('You do not have enough gold.', cid)
				Topic[cid] = 0
			end
		else
			npcHandler:say('Please tell me how much gold it is you would like to deposit.', cid)
			Topic[cid] = 1
		end
	elseif Topic[cid] == 1 then
		if getCount(msg) == -1 then
			npcHandler:say('Please tell me how much gold it is you would like to deposit.', cid)
			Topic[cid] = 1
		else
			if getPlayerMoney(cid) >= getCount(msg) then
				count[cid] = getCount(msg)
				npcHandler:say('Would you really like to deposit ' .. count[cid] .. ' gold?', cid)
				Topic[cid] = 2
			else
				npcHandler:say('You do not have enough gold.', cid)
				Topic[cid] = 0
			end
		end
	elseif msgcontains(msg, 'yes') and Topic[cid] == 2 then
		if doPlayerRemoveMoney(cid, count[cid]) then
			doPlayerSetBalance(cid, getPlayerBalance(cid) + count[cid])
			npcHandler:say('Alright, we have added the amount of ' .. count[cid] .. ' gold to your balance. You can withdraw your money anytime you want to.', cid)
		else
			npcHandler:say('I am inconsolable, but it seems you have lost your gold. I hope you get it back.', cid)
		end
		Topic[cid] = 0
	elseif msgcontains(msg, 'no') and Topic[cid] == 2 then
		npcHandler:say('As you wish. Is there something else I can do for you?', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'withdraw') then
		if getCount(msg) == 0 then
			npcHandler:say('Sure, you want nothing you get nothing!', cid)
			Topic[cid] = 0
		elseif getCount(msg) ~= -1 then
			if getPlayerBalance(cid) >= getCount(msg) then
				count[cid] = getCount(msg)
				npcHandler:say('Are you sure you wish to withdraw ' .. count[cid] .. ' gold from your bank account?', cid)
				Topic[cid] = 4
			else
				npcHandler:say('There is not enough gold on your account.', cid)
				Topic[cid] = 0
			end
		else
			npcHandler:say('Please tell me how much gold you would like to withdraw.', cid)
			Topic[cid] = 3
		end
	elseif Topic[cid] == 3 then
		if getCount(msg) == -1 then
			npcHandler:say('Please tell me how much gold you would like to withdraw.', cid)
			Topic[cid] = 3
		else
			if getPlayerBalance(cid) >= getCount(msg) then
				count[cid] = getCount(msg)
				npcHandler:say('Are you sure you wish to withdraw ' .. count[cid] .. ' gold from your bank account?', cid)
				Topic[cid] = 4
			else
				npcHandler:say('There is not enough gold on your account.', cid)
				Topic[cid] = 0
			end
		end
	elseif msgcontains(msg, 'yes') and Topic[cid] == 4 then
		if getPlayerBalance(cid) >= count[cid] then
			doPlayerAddMoney(cid, count[cid])
			doPlayerSetBalance(cid, getPlayerBalance(cid) - count[cid])
			npcHandler:say('Here you are, ' .. count[cid] .. ' gold. Please let me know if there is something else I can do for you.', cid)
		else
			npcHandler:say('There is not enough gold on your account.', cid)
		end
		Topic[cid] = 0
	elseif msgcontains(msg, 'no') and Topic[cid] == 4 then
		npcHandler:say('The customer is king! Come back anytime you want to if you wish to withdraw your money.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'transfer') then
		if getCount(msg) == 0 then
			npcHandler:say('Please think about it. Okay?', cid)
			Topic[cid] = 0
		elseif getCount(msg) ~= -1 then
			count[cid] = getCount(msg)
			if getPlayerBalance(cid) >= count[cid] then
				npcHandler:say('Who would you like to transfer ' .. count[cid] .. ' gold to?', cid)
				Topic[cid] = 6
			else
				npcHandler:say('There is not enough gold on your account.', cid)
				Topic[cid] = 0
			end
		else
			npcHandler:say('Please tell me the amount of gold you would like to transfer.', cid)
			Topic[cid] = 5
		end
	elseif Topic[cid] == 5 then
		if getCount(msg) == -1 then
			npcHandler:say('Please tell me the amount of gold you would like to transfer.', cid)
			Topic[cid] = 5
		else
			count[cid] = getCount(msg)
			if getPlayerBalance(cid) >= count[cid] then
				npcHandler:say('Who would you like to transfer ' .. count[cid] .. ' gold to?', cid)
				Topic[cid] = 6
			else
				npcHandler:say('There is not enough gold on your account.', cid)
				Topic[cid] = 0
			end
		end
	elseif Topic[cid] == 6 then
		local v = getPlayerByName(msg)
		if getPlayerBalance(cid) >= count[cid] then
			if v then
				transferTo_name[cid] = msg
				npcHandler:say('Would you really like to transfer ' .. count[cid] .. ' gold to ' .. getPlayerName(v) .. '?', cid)
				Topic[cid] = 7
			elseif playerExists(msg):lower() == msg:lower() then
				transferTo_name[cid] = msg
				npcHandler:say('Would you really like to transfer ' .. count[cid] .. ' gold to ' .. playerExists(msg) .. '?', cid)
				Topic[cid] = 7
			else
				npcHandler:say('This player does not exist.', cid)
				Topic[cid] = 0
			end
		else
			npcHandler:say('There is not enough gold on your account.', cid)
			Topic[cid] = 0
		end
	elseif Topic[cid] == 7 and msgcontains(msg, 'yes') then
		if getPlayerBalance(cid) >= count[cid] then
			local v = getPlayerByName(transferTo_name[cid])
			if v then
				doPlayerSetBalance(cid, getPlayerBalance(cid) - count[cid])
				doPlayerSetBalance(v, getPlayerBalance(v) + count[cid])
				npcHandler:say('Very well. You have transferred ' .. count[cid] .. ' gold to ' .. getPlayerName(v) .. '.', cid)
			elseif playerExists(transferTo_name[cid]):lower() == transferTo_name[cid]:lower() then
				doPlayerSetBalance(cid, getPlayerBalance(cid) - count[cid])
				db.executeQuery('UPDATE `players` SET `balance` = `balance` + ' .. count[cid] .. ' WHERE `name` = ' .. db.escapeString(transferTo_name[cid]) .. ' LIMIT 1;')
				npcHandler:say('Very well. You have transferred ' .. count[cid] .. ' gold to ' .. playerExists(transferTo_name[cid]) .. '.', cid)
			else
				npcHandler:say('This player does not exist.', cid)
			end
		else
			npcHandler:say('There is not enough gold on your account.', cid)
		end
		Topic[cid] = 0
	elseif Topic[cid] == 7 and msgcontains(msg, 'no') then
		npcHandler:say('Alright, is there something else I can do for you?', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'change gold') then
		npcHandler:say('How many platinum coins would you like to get?', cid)
		Topic[cid] = 8
	elseif Topic[cid] == 8 then
		if getCount(msg) < 1 then
			npcHandler:say('Hmm, can I help you with something else?', cid)
			Topic[cid] = 0
		else
			count[cid] = getCount(msg)
			npcHandler:say('So you would like me to change ' .. count[cid] * 100 .. ' of your gold coins into ' .. count[cid] .. ' platinum coins?', cid)
			Topic[cid] = 9
		end
	elseif Topic[cid] == 9 then
		if msgcontains(msg, 'yes') then
			if doPlayerRemoveItem(cid, 2148, count[cid] * 100) then
				npcHandler:say('Here you are.', cid)
				doPlayerAddItem(cid, 2152, count[cid])
			else
				npcHandler:say('Sorry, you do not have enough gold coins.', cid)
			end
		else
			npcHandler:say('Well, can I help you with something else?', cid)
		end
		Topic[cid] = 0
	elseif msgcontains(msg, 'change platinum') then
		npcHandler:say('Would you like to change your platinum coins into gold or crystal?', cid)
		Topic[cid] = 10
	elseif Topic[cid] == 10 then
		if msgcontains(msg, 'gold') then
			npcHandler:say('How many platinum coins would you like to change into gold?', cid)
			Topic[cid] = 11
		elseif msgcontains(msg, 'crystal') then
			npcHandler:say('How many crystal coins would you like to get?', cid)
			Topic[cid] = 13
		else
			npcHandler:say('Well, can I help you with something else?', cid)
			Topic[cid] = 0
		end
	elseif Topic[cid] == 11 then
		if getCount(msg) < 1 then
			npcHandler:say('Hmm, can I help you with something else?', cid)
			Topic[cid] = 0
		else
			count[cid] = getCount(msg)
			npcHandler:say('So you would like me to change ' .. count[cid] .. ' of your platinum coins into ' .. count[cid] * 100 .. ' gold coins for you?', cid)
			Topic[cid] = 12
		end
	elseif Topic[cid] == 12 then
		if msgcontains(msg, 'yes') then
			if doPlayerRemoveItem(cid, 2152, count[cid]) then
				npcHandler:say('Here you are.', cid)
				doPlayerAddItem(cid, 2148, count[cid] * 100)
			else
				npcHandler:say('Sorry, you do not have enough platinum coins.', cid)
			end
		else
			npcHandler:say('Well, can I help you with something else?', cid)
		end
		Topic[cid] = 0
	elseif Topic[cid] == 13 then
		if getCount(msg) < 1 then
			npcHandler:say('Hmm, can I help you with something else?', cid)
			Topic[cid] = 0
		else
			count[cid] = getCount(msg)
			npcHandler:say('So you would like me to change ' .. count[cid] * 100 .. ' of your platinum coins into ' .. count[cid] .. ' crystal coins for you?', cid)
			Topic[cid] = 14
		end
	elseif Topic[cid] == 14 then
		if msgcontains(msg, 'yes') then
			if doPlayerRemoveItem(cid, 2152, count[cid] * 100) then
				npcHandler:say('Here you are.', cid)
				doPlayerAddItem(cid, 2160, count[cid])
			else
				npcHandler:say('Sorry, you do not have enough platinum coins.', cid)
			end
		else
			npcHandler:say('Well, can I help you with something else?', cid)
		end
		Topic[cid] = 0
	elseif msgcontains(msg, 'change crystal') then
		npcHandler:say('How many crystal coins would you like to change into platinum?', cid)
		Topic[cid] = 15
	elseif Topic[cid] == 15 then
		if getCount(msg) == -1 or getCount(msg) == 0 then
			npcHandler:say('Hmm, can I help you with something else?', cid)
			Topic[cid] = 0
		else
			count[cid] = getCount(msg)
			npcHandler:say('So you would like me to change ' .. count[cid] .. ' of your crystal coins into ' .. count[cid] * 100 .. ' platinum coins for you?', cid)
			Topic[cid] = 16
		end
	elseif Topic[cid] == 16 then
		if msgcontains(msg, 'yes') then
			if doPlayerRemoveItem(cid, 2160, count[cid]) then
				npcHandler:say('Here you are.', cid)
				doPlayerAddItem(cid, 2152, count[cid] * 100)
			else
				npcHandler:say('Sorry, you do not have enough crystal coins.', cid)
			end
		else
			npcHandler:say('Well, can I help you with something else?', cid)
		end
		Topic[cid] = 0
	elseif msgcontains(msg, 'change') then
		npcHandler:say('There are three different coin types in Tibia: 100 gold coins equal 1 platinum coin, 100 platinum coins equal 1 crystal coin. So if you\'d like to change 100 gold into 1 platinum, simply say \'{change gold}\' and then \'1 platinum\'.', cid)
		Topic[cid] = 0
	elseif msgcontains(msg, 'bank') then
		npcHandler:say('We can change money for you. You can also access your bank account.', cid)
		Topic[cid] = 0
	end
	return TRUE
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())