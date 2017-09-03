local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

item = 'You do not have the required items.'
done = 'Here you are.'

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
		if msgcontains(msg, 'offer') then
		selfSay('You can here change some items for {warrior sweat}, {magic sulphur}, {enchanted chicken wing}, {fighting spirit}.', cid)

		elseif msgcontains(msg, 'warrior\'s sweat') then
				if getPlayerItemCount(cid,2475) >= 1 and getPlayerItemCount(cid,2475) >= 1 and getPlayerItemCount(cid,2475) >= 1 and getPlayerItemCount(cid,2475) >= 1 then
					selfSay('Did you bring me 4 warrior helmets?', cid)
					talk_state = 4
				else
					selfSay('I need {4 warrior helmet\'s}, to give you the warrior\'s sweat. Come back when you have them.', cid)
					talk_state = 0
				end
		elseif msgcontains(msg, 'yes') and talk_state == 4 then
			talk_state = 0
			if getPlayerItemCount(cid,2475) >= 4 then
					if doPlayerRemoveItem(cid,2475,1) == TRUE and doPlayerRemoveItem(cid,2475,1) == TRUE and doPlayerRemoveItem(cid,2475,1) == TRUE and doPlayerRemoveItem(cid,2475,1) == TRUE then
						doPlayerAddItem(cid,5885,1)
						selfSay(done, cid)
					end
				else
				selfSay(item, cid)
				end

elseif msgcontains(msg, 'magic sulphur') then
if getPlayerItemCount(cid,2392) >= 1 and getPlayerItemCount(cid,2392) >= 1 and getPlayerItemCount(cid,2392) >= 1 then
selfSay('Did you bring me 3 fire swords?', cid)
talk_state = 5
else
selfSay('I need {3 fire sword\'s}, to give you the magic sulpher. Come back when you have them.', cid)
talk_state = 0
end

		elseif msgcontains(msg, 'yes') and talk_state == 5 then
			talk_state = 0
			if getPlayerItemCount(cid,2392) >= 3 then
					if doPlayerRemoveItem(cid,2392,1) == TRUE and doPlayerRemoveItem(cid,2392,1) == TRUE and doPlayerRemoveItem(cid,2392,1) == TRUE then
						doPlayerAddItem(cid,5904,1)
										selfSay(done, cid)
				end
			else
				selfSay(item, cid)
			end

		elseif msgcontains(msg, 'enchanted chicken wing') then
			if getPlayerItemCount(cid,2195) >= 1 then
				selfSay('Did you bring me boots of haste?', cid)
				talk_state = 6
			else
				selfSay('I need {boots of haste}, to give you the enchanted chicken wing. Come back when you have them.', cid)
				talk_state = 0
			end

		elseif msgcontains(msg, 'yes') and talk_state == 6 then
			talk_state = 0
			if getPlayerItemCount(cid,2195) >= 1 then
					if doPlayerRemoveItem(cid,2195,1) == TRUE then
						doPlayerAddItem(cid,5891,1)
										selfSay(done, cid)
					end
			else
				selfSay(item, cid)
			end

		elseif msgcontains(msg, 'fighting spirit') then
			if getPlayerItemCount(cid,2498) >= 1 and getPlayerItemCount(cid,2498) >= 1 then
				selfSay('Did you bring me the 2 Royal Helmets?', cid)
				talk_state = 10
			else
				selfSay('I need a {2 Royal Helmet\'s}, to give you the Fighting Spirit. Come back when you have them.', cid)
				talk_state = 0
			end
		elseif msgcontains(msg, 'yes') and talk_state == 10 then
			talk_state = 0
			if getPlayerItemCount(cid,2498) >= 2 then
					if doPlayerRemoveItem(cid,2498,1) == TRUE and doPlayerRemoveItem(cid,2498,1) == TRUE then
						doPlayerAddItem(cid,5884,1)
										selfSay(done, cid)
					end

			else
				selfSay(item, cid)
			end

        elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 5) then
            selfSay('So Leave, LEAVE ME NOW!')
            talk_state = 0
        end
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
