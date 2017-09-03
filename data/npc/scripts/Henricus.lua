local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end
function creatureSayCallback(cid, type, msg)
        if(not npcHandler:isFocused(cid)) then
                return false
        end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local storage = getPlayerStorageValue(cid, 1889)
	local storagee = getPlayerStorageValue(cid, 1996)
	
	if(msgcontains(msg, 'join') or msgcontains(msg, 'inquisition'))then
		if storage == -1 then
			npcHandler:say("Do you want to join the inquisition?", cid)
			talkState[talkUser] = 1
		else
			npcHandler:say("You are already a member of the inquisition.", cid)
			talkState[talkUser] = 0
		end
		
	elseif msgcontains(msg, 'mission') then
		if storage == 1 then
			npcHandler:say("Let's see if you are worthy. Take an inquisitor's field guide from the box in the back room. ...", cid)
			npcHandler:say("Follow the instructions in the guide to talk to the Thaian guards that protect the walls and gates of the city and test their loyalty. Then report to me about your mission.", cid)
			setPlayerStorageValue(cid, 1889, 2)
			talkState[talkUser] = 0
		elseif storage == 18 then
			npcHandler:say("Your current mission is to investigate the reliability of certain guards. Are you done with that mission?", cid)
			talkState[talkUser] = 3		
			elseif storage == 19 then
			if getPlayerStorageValue(cid, 1996) == -1 then
			npcHandler:say("Now you need to complete The Shadow Nexus and come back to me.", cid)
			npcHandler:say("Use this vial of holy water to destroy the Shadow Nexus.", cid)
			local item2 = doPlayerAddItem(cid, 7494, 1)
			setPlayerStorageValue(cid, 1996, 1)
			talkState[talkUser] = 0
		elseif getPlayerStorageValue(cid, 1883) == 1 then
			npcHandler:say("Your current mission is to destroy the Shadow Nexus. Are you done with that mission?", cid)
			talkState[talkUser] = 4
	end
		end

	elseif msgcontains(msg, 'yes') then		
		if talkState[talkUser] == 1 then
				if storage == -1 then
					npcHandler:say("So be it. Now you are a member of the inquisition. You might ask me for a mission to raise in my esteem.", cid)
					setPlayerStorageValue(cid, 1889, 1)
					--talkState[talkUser] = 0
				end
		elseif talkState[talkUser] == 2 then
				if storage == 1 then
					npcHandler:say("Indeed, this is exactly what my other sources told me. Of course I knew the outcome of this investigation in advance. This was just a test...", cid)
					npcHandler:say("Well, now that you've proven yourself as useful, you can ask me for another mission.", cid)
					setPlayerStorageValue(cid, 1889, 2)
					talkState[talkUser] = 0
				end
		elseif talkState[talkUser] == 3 then
				if storage == 18 then
					npcHandler:say("Indeed, this is exactly what my other sources told me. Of course I knew the outcome of this investigation in advance. This was just a test...", cid)
					npcHandler:say("Well, now that you've proven yourself as useful, you can ask me for another mission.", cid)
					setPlayerStorageValue(cid, 1889, 19)
					talkState[talkUser] = 0
				end
		elseif talkState[talkUser] == 4 then
				if getPlayerStorageValue(cid, 1883) == 1 then

					npcHandler:say("Fine, fine. You have proven that you can work efficiently. Now you can enter the reward room and choose your reward and Enjoy your new fresh outfit!", cid)
					setPlayerStorageValue(cid, 14916, 1)
					talkState[talkUser] = 0
				end
				
			
		
			
		end
	end
	return TRUE
end




npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())