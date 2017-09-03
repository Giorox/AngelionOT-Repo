local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local config = {
	storage_join = 15001,
	storage_dream = 15002,
	storage_rank = 15003,
	doors_aid = 15006,
	demonic_id = 6500,
	max_rank=4,
	shield_id = 6433;
}

local basic_rank = "Maggot"
local ranks = {
		[1] = {{500,"Hyaena"},{1000, "Death Dealer"},{1500,"Dread Lord"}}, --BB
		}

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	

	if msgcontains(msg, 'join') and getPlayerStorageValue(cid, config.storage_join) < 1 then
		if(getPlayerStorageValue(cid,config.storage_dream) < 1) then
		--npcHandler:say('The Brotherhood of Bones has suffered greatly in the past, but we did survive as we always will ...', cid)
		--addEvent(npcHandler:say,2000, "You have proven resourceful by beating the silly riddles the Nightmare Knights set up to test their candidates ...", cid)
		--addEvent(npcHandler:say,5000, "It's an amusing thought that after passing their test you might choose to join the ranks of their sworn enemies ... ", cid)
			npcHandler:say("For the irony of this I ask you, ".. getCreatureName(cid) ..": Do you want to join the Brotherhood of Bones?", cid)
			talkState[talkUser] = 1
		else
			npcHandler:say("You can not join my order. Sorry.",cid);
		end
					
						
	elseif msgcontains(msg, 'yes') then
		if(talkState[talkUser] == 1) then
			npcHandler:say('But know that your decision will be irrevocable. You will abandon the opportunity to join any order whose doctrine is incontrast to our own... Do you still want to join the Brotherhood?',cid)
			--addEvent(npcHandler:say,4000, "Do you still want to join the Brotherhood?",cid)
			talkState[talkUser] = 2
			
		elseif(talkState[talkUser] == 2) then
			npcHandler:say('Welcome to the Brotherhood! From now on you will walk the path of Bones. A life full of promises and power has just beenoffered to you. You can always ask me about your current rank and about the privileges the ranks grant to those who hold them.',cid)
			--addEvent(npcHandler:say,4000, "Take it, if you are up to that challenge ... or perish in agony if you deserve this fate ...",cid)
			--addEvent(npcHandler:say,7000, "You can always ask me about your current rank and about the privileges the ranks grant to those who hold them.",cid)
			setPlayerStorageValue(cid, config.storage_join, 1);
			setPlayerStorageValue(cid, config.storage_rank, 1);
		elseif(talkState[talkUser] == 3) then	
			local rank = getPlayerStorageValue(cid,config.storage_rank)
			if(getPlayerItemCount(cid,config.demonic_id)>= ranks[1][rank][1]) then
				doPlayerRemoveItem(cid, config.demonic_id ,ranks[1][rank][1])
				if(rank == 2) then
					npcHandler:say('You are worthy of an advancement. I grand you the rank of a '.. ranks[1][rank][2] ..' of our order. Take this shield as a symbol of your new status.',cid)
					doPlayerAddItem(cid, config.shield_id,1)
				elseif(rank == 3) then
					npcHandler:say('You are worthy of an advancement. I grand you the rank of a '.. ranks[1][rank][2] ..' of our order. You are able now to enter this room and create documents.',cid)
					setPlayerStorageValue(cid, config.doors_aid,1)
				else
					npcHandler:say('You are worthy of an advancement. I grand you the rank of a '.. ranks[1][rank][2] ..' of our order.',cid)
				end
				setPlayerStorageValue(cid,config.storage_rank,rank+1)
			else
				npcHandler:say('You don\'t have enough demonic essences.',cid)
			end
			
		end
	elseif msgcontains(msg, 'advancement') then	
		local rank = getPlayerStorageValue(cid,config.storage_rank)
		if(rank < 1) then
			npcHandler:say('You are not member of our order.',cid)
		elseif(rank>= config.max_rank) then
			npcHandler:say('You are already master of our order.',cid);
		else
			npcHandler:say('To advance to rank '.. ranks[1][rank][2] ..', you have to bring me '.. ranks[1][rank][1] ..' demonic essences. Do you have it with yourself?',cid)
			talkState[talkUser] = 3
		end
	
	elseif (msgcontains(msg, 'rank')) then
		local rank = getPlayerStorageValue(cid,config.storage_rank)
		if(rank < 1) then
			npcHandler:say('You are not member of our order.',cid)
		elseif(rank == 1) then
			npcHandler:say('You are '.. basic_rank ..' of our order.',cid)
		else
			npcHandler:say('You are '.. ranks[1][rank-1][2] ..' of our order',cid)
		end

	elseif (msgcontains(msg, 'no') and talkState[talkUser] > 0)  then
		talkState[talkUser] = 0
		npcHandler:say('Suecide yourself.',cid)
	end	
	
	return TRUE	
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())