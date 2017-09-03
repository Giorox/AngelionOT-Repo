local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg) end
function onThink()					npcHandler:onThink() end
 
item = 'You do not have the required Level or You Already have a Vocation!.'
done = 'Congratulations now you are druid, Go to the dungeon and take your items and hunt.'
 
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
 
	if msgcontains(msg, 'ok') then
		selfSay('Do you Want to become a {druid}?', cid)
	elseif msgcontains(msg, 'yes') then
                        if(getPlayerLevel(cid) > 1) then                   
			selfSay('Say it Proudly: Yes, I Want to Become a druid!', cid)
			talk_state = 1
		else
			selfSay('You do not have the required Level or You Already have a Vocation!.', cid)
			talk_state = 0
		end
	elseif msgcontains(msg, 'druid') and talk_state == 1 then
		talk_state = 0
                if getCreatureStorage(cid, 43211) == 1 == FALSE then
			selfSay(done, cid)
			doPlayerSetVocation(cid, 2)
                        setPlayerStorageValue(cid, 43211,1)
                        doSendMagicEffect(getCreaturePosition(cid), 14)
		else
			selfSay(item, cid)
		end
	elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 5) then
		selfSay('Ok than.')
		talk_state = 0
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())