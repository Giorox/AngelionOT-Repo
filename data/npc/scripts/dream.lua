local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local config = {
	storage_join = 15002,
	storage_bb = 15001,
	storage_rank = 15004,
	doors_aid = 15005,
	demonic_id = 6500,
	max_rank=4,
	shield_id = 6391;
}

local basic_rank = "Novice";
local ranks = {
		[1] = {{500,"Initiate"},{1000, "Dreamer"},{1500,"Lord Protector"}}, --nightmares
		}

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	

	if msgcontains(msg, 'join') and getPlayerStorageValue(cid, config.storage_join) < 1 then
		if(getPlayerStorageValue(cid,config.storage_bb) < 1) then
			npcHandler:say('The Nightmare Knights are almost extinct now, and as far as I know I am the only teacher that is left.So I ask you: do you wish to become a member of the ancient order of the Nightmare Knights, '.. getCreatureName(cid).. '?', cid)
		--addEvent(npcHandler:say,4000, "After all you have passed the Dream Challenge to reach this place, which used to be the process of initiation in the past... ", cid)
		--addEvent(npcHandler:say,7000, "So I ask you: do you wish to become a member of the ancient order of the Nightmare Knights, ".. getCreatureName(cid).. "?", cid)
			talkState[talkUser] = 1
		else
			npcHandler:say("You can not join my order. Sorry.",cid);
		end
		
		
					
						
	elseif msgcontains(msg, 'yes') then
		if(talkState[talkUser] == 1) then
			npcHandler:say('Please know that your decision is irrevocable. You will abandon the opportunity to join any order whose doctrine is incontrast to our own ... Do you still want to join our order?',cid)
			--addEvent(npcHandler:say,4000, "Do you still want to join our order? ",cid)
			talkState[talkUser] = 2
			
		elseif(talkState[talkUser] == 2) then
			npcHandler:say('So I welcome you as the latest member of the order of the Nightmare Knights. You entered this place as a stranger, but you will leave this place as a friend ... ',cid)
			npcHandler:say('You can always ask me about your current rank and about the privileges the ranks grant to those who hold them.',cid,1)
			--addEvent(npcHandler:say,4000, "You can always ask me about your current rank and about the privileges the ranks grant to those who hold them.",cid)
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
			npcHandler:say('You are not member of our order',cid)
		elseif(rank>= config.max_rank) then
			npcHandler:say('You are already master of our order.',cid);
		else
			npcHandler:say('To advance to rank '.. ranks[1][rank][2] ..', you have to bring me '.. ranks[1][rank][1] ..' demonic essences. Do you have it with yourself?',cid)
			talkState[talkUser] = 3
		end	
			
	elseif (msgcontains(msg, 'rank')) then
		local rank = getPlayerStorageValue(cid,config.storage_rank)
		if(rank < 1) then
			npcHandler:say('You are not member of our order',cid)
		elseif(rank == 1) then
			npcHandler:say('You are '.. basic_rank ..' of our order',cid)
		else
			npcHandler:say('You are '.. ranks[1][rank-1][2] ..' of our order',cid)
		end
	
	elseif (msgcontains(msg, 'no') and talkState[talkUser] > 0) then 
		talkState[talkUser] = 0
		npcHandler:say('Suecide yourself.',cid)
	end				
				
	return TRUE	
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())