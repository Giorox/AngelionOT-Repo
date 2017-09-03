local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if (msgcontains(msg, "hello") or msgcontains(msg, "hi")) and not npcHandler:isFocused(cid) then
		if getCreatureHealth(cid) < 65 then
			npcHandler:say("Hello, "..getCreatureName(cid).."! You are looking really bad. Let me heal your wounds.", cid)
			doCreatureAddHealth(cid, 65 - getCreatureHealth(cid))
			doSendMagicEffect(getCreaturePosition(cid), 12)
		else
			selfSay("Hello, "..getCreatureName(cid).."! I'll {heal} you if you are badly injured or poisoned. Feel free to ask me for {help} or general {hints}.", cid, TRUE)
			npcHandler:addFocus(cid)
		end
		return true
	end
	if(not npcHandler:isFocused(cid)) then
		return false
	elseif msgcontains(msg, "bye") or msgcontains(msg, "farewell") then
		selfSay("Farewell, " .. getCreatureName(cid) .. "!", cid, TRUE)
		npcHandler:releaseFocus(cid)
	elseif msgcontains(msg, "heal") then
		if getCreatureCondition(cid, CONDITION_FIRE) == TRUE then
			npcHandler:say("You are burning. I will help you.", cid)
			doRemoveCondition(cid, CONDITION_FIRE)
			doSendMagicEffect(getCreaturePosition(cid), 14)
		elseif getCreatureCondition(cid, CONDITION_POISON) == TRUE then
			npcHandler:say("You are poisoned. I will help you.", cid)
			doRemoveCondition(cid, CONDITION_POISON)
			doSendMagicEffect(getCreaturePosition(cid), 13)
		elseif getCreatureHealth(cid) < 65 then
			npcHandler:say("You are looking really bad. Let me heal your wounds.", cid)
			doCreatureAddHealth(cid, 65 - getCreatureHealth(cid))
			doSendMagicEffect(getCreaturePosition(cid), 12)
		else
			npcHandler:say("You aren't looking really bad, " .. getCreatureName(cid) .. ". I only help in cases of real emergencies. Raise your health simply by eating {food}.", cid)
		end
	end
	return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_WALKAWAY, "Well, bye then.")
