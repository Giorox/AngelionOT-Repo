local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local Topic = {}
local questLog = 14503
local task = 14504

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function greetCallback(cid)
	Topic[cid] = 0
	return true
end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, 'task') then
		if getPlayerStorageValue(cid, 14003) < 0 then
			selfSay({'What? Who are you to imply I need help from a worm like you? ...', 'I don\'t need help. But if you desperately wish to do something to earn the favour of Zathroth, feel free. Don\'t expect any reward though. ...', 'Do you want to help and serve Zathroth out of your own free will, without demanding payment or recognition?'}, cid)
			Topic[cid] = 1
		elseif getPlayerStorageValue(cid, 14003) == 4000 and getPlayerStorageValue(cid, 14103) < 1 then
			selfSay({'You\'ve slain a mere 4000 necromancers and priestesses. Still, you\'ve shown some dedication. Maybe that means you can kill one of those so-called \'leaders\' too. ...', 'Deep under Drefia, a necromancer called Necropharus is hiding in the Halls of Sacrifice. I\'ll place a spell on you with which you will be able to pass his weak protective gate. ...', 'Know that this will be your only chance to enter his room. If you leave it or die, you won\'t be able to return. We\'ll see if you really dare enter those halls.'}, cid)
			setPlayerStorageValue(cid, 14103, 1)
		elseif getPlayerStorageValue(cid, 14103) == 2 then
			selfSay({'So you had the guts to enter that room. Well, it\'s all fake magic anyway and no real threat. ...', 'What are you looking at me for? Waiting for something? I told you that there was no reward. Despite being allowed to stand before me without being squashed like a bug. Get out of my sight!'}, cid)
			setPlayerStorageValue(cid, 14103, 3)
			npcHandler:releaseFocus(cid)
		end
	elseif Topic[cid] == 1 and msgcontains(msg, 'yes') then
		selfSay({'You do? I mean - wise decision. Let me explain. By now, Tibia has been overrun by numerous followers of different cults and beliefs. The true Necromancers died or left Tibia long ago, shortly after their battle was lost. ...', 'What is left are mainly pseudo-dark pretenders, the old wisdom and power being far beyond their grasp. They think they have the right to tap that dark power, but they don\'t. ...', 'I want you to eliminate them. As many as you can. Both necromancers and priestesses. And as I said, don\'t expect a reward - this is what has to be done to cleanse Tibia of its false dark prophets.'}, cid)
		setPlayerStorageValue(cid, 14003, 0)
		if getPlayerStorageValue(cid, questLog) < 1 then
			setPlayerStorageValue(cid, questLog, 1)
		end
		Topic[cid] = 0
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_GREET, 'What is it that you want, |PLAYERNAME|?')
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())