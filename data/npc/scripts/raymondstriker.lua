local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local Topic = {}
local pirate = tasks["pirate ghost"]

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	elseif (msgcontains(msg, "task")) then
		if (getPlayerStorageValue(cid, pirate.storage) == -1) then
			selfSay("The pirates on Nargor are becoming more and more of a threat to us each day. I wish someone could get rid of them once and for all, but unfortunately they just keep coming! ...", cid)
			selfSay("Only a dead pirate is a good pirate. I think killing a large number of them would definitely help us to make Sabrehaven a safer place. ...", cid)
			selfSay("It doesn't matter how long it takes, but... would you be willing to kill 3000 pirates for us?", cid)
			Topic[cid] = 15
		elseif (getPlayerStorageValue(cid, pirate.storage) == pirate.amount) then
			selfSay("Hey, great. You've done well! As a small reward I give you some coins from our treasure box. Also, let me tell you an interesting piece of information. ...", cid)
			selfSay("One our of spies told us about a secret hideout somewhere on Nargor. Supposedly, one of the four pirate leaders can be found there sometimes. If you dare go there, you might be able to face him or her in one on one combat. ...", cid)
			selfSay("Beware though - prepare yourself well and only flee if you must. This might be your only chance to get into there, so be careful and don't die!", cid)
		end
	elseif (msgcontains(msg, "yes") and Topic[cid] == 15) then
		selfSay("Perfect. I know it sounds a lot, but really, take your time. You won't do it for nothing, I promise.", cid)
		setPlayerStorageValue(cid, pirate.storage, 0)
		Topic[cid] = 0
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
