local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic, Town = {}, {}
 
function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg) end
function onThink()						npcHandler:onThink() end
 
function thinkCallback(cid)
	if math.random(300) == 1 then
		npcHandler:say("Harr! Wanna go off this island? Need me an' my ship!")
	end
	return true
end
 
function creatureSayCallback(cid, type, msg)
	if (msgcontains(msg, "hello") or msgcontains(msg, "hi")) and (not npcHandler:isFocused(cid)) then
		local v, k = getPlayerVocation(cid), getCreatureName(cid)
		if v == 0 then
			npcHandler:say(getPlayerSex(cid) == 0 and "Well hello there, lovely lady! Can't sail you anywhere without a {vocation}, though. Y'should talk to the four vocation {masters} first, " .. k .. "." or "How cute, a freshly hatched newcomer. Harr. Can't leave this island without a {vocation}, y'know? Y'should talk to the four vocation {masters} first, " .. k.. ".", cid)
			Topic[cid] = 0
		else
			npcHandler:say("Harrr, a new " .. getVocationInfo(v).name .. "! Can't wait to get off this lousy island and head for adventure, eh? Want me to bring ya somewhere nice, I rlly recomend you thais cuz the king lives ther an also if u wanna hav' lot f fun, " .. k .. "?", cid)
			Topic[cid] = 1
		end
		Town[cid] = nil
		npcHandler:addFocus(cid)
	elseif(not npcHandler:isFocused(cid)) then
		return false
	elseif msgcontains(msg, "bye") or msgcontains(msg, "farewell") then
		npcHandler:say("Hrrrm. Better y'stay here for a bit, aight.", cid, TRUE)
		Topic[cid] = nil
		Town[cid] = nil
		npcHandler:releaseFocus(cid)
	elseif Topic[cid] == 1 then
		if msgcontains(msg, "yes") then
			npcHandler:say("Take a hint from old Cap'n Kurt. Make sure y'dun leave here before yer equipped well. Ya went for rob- err, shopping and got stuff like rope, armor, and weap'n?", cid)
			Topic[cid] = 2
		elseif msgcontains(msg, "no") then
			npcHandler:say("Then what'd ya want? Learn about the main Tibian cities?", cid)
			Topic[cid] = 3
		else
			npcHandler:say("Kid, one thing y'should learn. Answer with {yes} or {no} and ya'll get much farther than with random babbling.", cid)
			Topic[cid] = 1
		end
	elseif Topic[cid] == 2 then
		if msgcontains(msg, "yes") then
			npcHandler:say("Harrharr. Good answer. Wanna know somethin' about the main Tibian cities before you choose yer new home?", cid)
			Topic[cid] = 3
		elseif msgcontains(msg, "no") then
			npcHandler:say("Then prepare yourself and come back later, eh?", cid)
			npcHandler:releaseFocus(cid)
			Topic[cid] = nil
		end
	elseif Topic[cid] == 3 then
		if msgcontains(msg, "yes") then
			npcHandler:say("Aye. Wanna know about {Ab'Dendriel}, {Ankrahmun}, {Carlin}, {Darashia}, {Edron}, {Kazordoon}, {Liberty} {Bay}, {Port} {Hope}, {Svargrond}, {Thais}, {Venore} or {Yalahar}?", cid)
			Topic[cid] = 0
		elseif msgcontains(msg, "no") then
			npcHandler:say(isPremium(cid) and "So ya know it all, eh? Where'd ya want me to bring ya then, kid? {Ab'Dendriel}, {Ankrahmun}, {Carlin}, {Darashia}, {Edron}, {Liberty Bay}, {Port Hope}, {Thais} or {Venore}?" or "So ya know it all, eh? Where'd ya want me to bring ya then, kid? {Ab'Dendriel}, {Carlin}, {Thais} or {Venore}?", cid)
			Topic[cid] = 4
		end
	elseif Topic[cid] == 4 then
		if msgcontains(msg, "ab'dendriel") then
			npcHandler:say("So it's Ab'Dendriel y'wanna live in? What y'say, {yes} or {no}?", cid)
			Topic[cid] = 5
			Town[cid] = "Ab'Dendriel"
		elseif msgcontains(msg, "ankrahmun") then
			if isPremium(cid) then
				npcHandler:say("So it's Ankrahmun y'wanna live in? What y'say, {yes} or {no}?", cid)
				Topic[cid] = 5
				Town[cid] = 'Ankrahmun'
			else
				npcHandler:say("Nope, can't bring y'there without a premium account. Y'should be glad you get to travel by ship, usually a premium service, too, y'know.", cid)
				Topic[cid] = 0
			end
		elseif msgcontains(msg, "carlin") then
			npcHandler:say("So it's Carlin y'wanna live in? What y'say, {yes} or {no}?", cid)
			Topic[cid] = 5
			Town[cid] = 'Carlin'
		elseif msgcontains(msg, "darashia") then
			if isPremium(cid) then
				npcHandler:say("So it's Darashia y'wanna live in? What y'say, {yes} or {no}?", cid)
				Topic[cid] = 5
				Town[cid] = 'Darashia'
			else
				npcHandler:say("Nope, can't bring y'there without a premium account. Y'should be glad you get to travel by ship, usually a premium service, too, y'know.", cid)
				Topic[cid] = 0
			end
		elseif msgcontains(msg, "edron") then
			if isPremium(cid) then
				npcHandler:say("So it's Edron y'wanna live in? What y'say, {yes} or {no}?", cid)
				Topic[cid] = 5
				Town[cid] = 'Edron'
			else
				npcHandler:say("Nope, can't bring y'there without a premium account. Y'should be glad you get to travel by ship, usually a premium service, too, y'know.", cid)
				Topic[cid] = 0
			end
		elseif msgcontains(msg, "liberty") and msgcontains(msg, "bay") then
			if isPremium(cid) then
				npcHandler:say("So it's Liberty Bay y'wanna live in? What y'say, {yes} or {no}?", cid)
				Topic[cid] = 5
				Town[cid] = 'Liberty Bay'
			else
				npcHandler:say("Nope, can't bring y'there without a premium account. Y'should be glad you get to travel by ship, usually a premium service, too, y'know.", cid)
				Topic[cid] = 0
			end
		elseif msgcontains(msg, "port") and msgcontains(msg, "hope") then
			if isPremium(cid) then
				npcHandler:say("So it's Port Hope y'wanna live in? What y'say, {yes} or {no}?", cid)
				Topic[cid] = 5
				Town[cid] = 'Port Hope'
			else
				npcHandler:say("Nope, can't bring y'there without a premium account. Y'should be glad you get to travel by ship, usually a premium service, too, y'know.", cid)
				Topic[cid] = 0
			end
		elseif msgcontains(msg, "thais") then
			npcHandler:say("So it's Thais y'wanna live in? What y'say, {yes} or {no}?", cid)
			Topic[cid] = 5
			Town[cid] = 'Thais'
		elseif msgcontains(msg, "venore") then
			npcHandler:say("So it's Venore y'wanna live in? What y'say, {yes} or {no}?", cid)
			Topic[cid] = 5
			Town[cid] = 'Venore'
		else
			npcHandler:say("Nope, wha'ever that is, I dun sail there. ".. isPremium(cid) and "{Ab'Dendriel}, {Ankrahmun}, {Carlin}, {Darashia}, {Edron}, {Liberty Bay}, {Port Hope}, {Thais} or {Venore}" or "{Ab'Dendriel}, {Carlin}, {Thais} or {Venore}" .."?", cid)
			Topic[cid] = 5
		end
	elseif msgcontains(msg, "passage") or msgcontains(msg, "sail") or msgcontains(msg, "travel") then
		if getPlayerVocation(cid) == 0 then
			npcHandler:say("Nope, yer not going anywhere. Can't transport ya without a {vocation}, y'know?", cid)
			Topic[cid] = 0
		else
			npcHandler:say("So, y'chose your new home city? Which one's it gonna be?", cid)
			Topic[cid] = 4
		end
	elseif Topic[cid] == 5 then
		if msgcontains(msg, 'yes') then
			npcHandler:say("And off we go! If yer lost, dun forget t'talk to the guide on the ship!", cid)
			local v = getTownId(Town[cid])
			npcHandler:releaseFocus(cid)
			doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, getTownTemplePosition(v))
			doSendMagicEffect(getTownTemplePosition(v), CONST_ME_TELEPORT)
			doPlayerSetTown(cid, v)
			Topic[cid] = nil
		else
			npcHandler:say("Changed yer mind? What city d'ya wanna head to, {Ab'Dendriel}, {Ankrahmun}, {Carlin}, {Darashia}, {Edron}, {Liberty Bay}, {Port Hope}, {Thais} or {Venore}?", cid)
			Topic[cid] = 4
		end
		Town[cid] = nil
	elseif msgcontains(msg, "ab'dendriel") then
		npcHandler:say("Ab... Den... wha'ever, I never get that spelling right. Main city of the elves, lots of trees 'n stuff. Very cosy and safe I guess if yer fond of nature. I can {sail} there if ya like.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "ankrahmun") then
		npcHandler:say("Only for {premium} travellers! Desert pyramid city close to the ocean, far too hot and dry for my taste. But word is there are good hunting grounds nearby. I can {sail} there if ya like.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "carlin") then
		npcHandler:say("A city ruled by crazy amazon women! Blimey! Depends on yer taste whether ya think that's good or not. Harr. I can {sail} there if ya like.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "darashia") then
		npcHandler:say("Only for {premium} travellers! One of the two desert cities. Built around an oasis. Decent location for a newcomer. I can {sail} there if ya like.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "edron") then
		npcHandler:say("Only for {premium} travellers! Quiet little castle city on an island in the north-eastern part of Tibia. Good place for starters, really. I can {sail} there if ya like.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "kazordoon") then
		npcHandler:say("The underground dwarven city. Doesn't have a real harbour, so I can't bring ya there, y'know.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "liberty") and msgcontains(msg, "bay") then
		npcHandler:say("Only for {premium} travellers! Liberty Bay is on an island group in the South Seas. Pirates 'n stuff, y'know. Gotta be careful, but good hunting location. I can {sail} there if ya like.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "port") and msgcontains(msg, "hope") then
		npcHandler:say("Only for {premium} travellers! Port Hope is an outpost right in the middle of the jungle. Who'd want to go there?? Except for really crazy adventurers? I can {sail} there if ya like.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "svargrond") then
		npcHandler:say("Nah, can't bring ya there. Those nordic barbarians have their own rules of who they wanna let live in their city. But go there sometime, heard it's quite interesting.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "thais") then
		npcHandler:say("Old-school city. Actually the oldest main city in Tibia. Be careful on those streets, there're bandits everywhere. I can {sail} there if ya like.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "venore") then
		npcHandler:say("Harrr, one of the richest cities, filled with merchants. Dunno though why they built it over a stinking swamp. Go there if ya have a good sense of orientation. I can {sail} there if ya like.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "yalahar") then
		npcHandler:say("Now that must be one o' the biggest cities I've ever seen. Might be not cosy for a newcomer like yerself though. And I can't sail there anyway... they don't let everyone enter their fine pretty harbour, y'know.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "rookgaard") then
		npcHandler:say("Nah, y'dun wanna go back there.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "main") then
		npcHandler:say("The main continent can be dangerous. Other fellas can kill ya, y'know? So be careful! Wanna go there, ask fo' a {passage}.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "master") then
		npcHandler:say("Lemme get this right, ahum. {Estrella}, {Hykrion}, {Narai} and {Yandur}. Aye, that's it.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "estrella") then
		npcHandler:say("Scary lady. Makes me feel sorta stupid at times. Talk t'her for {sorcerer} info.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "hykrion") then
		npcHandler:say("Harr. My training partner, aye. Talk t'him for {knight} info.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "narai") then
		npcHandler:say("Harrrrrrrrrr. Nuff said. Talk t'her for {paladin} info.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "raffael") then
		npcHandler:say("A shop without rum or beer ain't a good shop. Just my opinion, man.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "kurt") then
		npcHandler:say("Hrm?", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "yandur") then
		npcHandler:say("Can be nice t'have a healer around. Talk t'him for {druid} info.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "knight") then
		npcHandler:say("Rock solid vocation. Easy t'play, hard t'master.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "sorcerer") then
		npcHandler:say("Turns out pretty powerful in the end.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "druid") then
		npcHandler:say("Decent vocation. Healing's always nice.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "paladin") then
		npcHandler:say("I prefer t'have my enemies closer to my face than those distance fighters. Harrr.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "vocation") then
		npcHandler:say("Ya must have one if ya wanna leave here. Need some power before going to the {main} continent, aye!", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "ship") then
		npcHandler:say("She's pretty, ain't she? Will bring ya almost anywhere and even fo' free. Just once though! Gotta ask fo' a {passage}.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "premium") then
		npcHandler:say("Some regions in the world can't be accessed by everyone. Gotta pay, y'know? If y'spend some real cash fo' premium time, I can bring ya t'much cooler locations.", cid)
		Topic[cid] = 0
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_WALKAWAY, "Hrrrrm. And a good day to you, too!")
npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)