local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end


function creatureSayCallback(cid, type, msg)
if (not npcHandler:isFocused(cid)) then
        return false
    end

		local queststate = getPlayerStorageValue(cid,6665)
		
		if msgcontains(msg, 'crunor\'s caress') and queststate == 1 then
		npcHandler:say('Don\'t ask. They were only an unimportant footnote of history.', cid)
        talk_state = 1
		elseif msgcontains(msg, 'footnote') and talk_state == 1 then
			npcHandler:say('They thought they have to bring Crunor to the people, if people did not find to Crunor of their own. To achieve that they founded the inn Crunor\'s Cottage, south of Mt. Sternum.', cid)
				setPlayerStorageValue(cid,6666,1)
                talk_state = 2
		elseif msgcontains(msg, 'bye') and (talk_state >= 1 and talk_state <= 2) then
		npcHandler:say('Farewell.', cid)

			talk_state = 0
		end
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
