local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local Topic = {}
local tomes = 85300
local clothTime = 85301

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)            npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	elseif msgcontains(msg, "tome") then
		npcHandler:say("Oh! That sounds fascinating. Have you found a " .. (getPlayerStorageValue(cid, tomes) > 0 and "new " or "") .. "Tome of Knowledge for me to read?" .. (getPlayerStorageValue(cid, tomes) > 11 and " I have the feeling though that I can only share some of my experience with you now. Is that alright with you?" or ""), cid)
		Topic[cid] = 1
	elseif Topic[cid] == 1 then
		if doPlayerRemoveItem(cid, 11128, 1) == TRUE then
			if getPlayerStorageValue(cid, tomes) < 12 then
				npcHandler:say("Thank you! I look forward to reading this interesting discovery of yours and learn a few things about Zao.", cid)
				setPlayerStorageValue(cid, tomes, math.max(0, getPlayerStorageValue(cid, tomes)) + 1)
			else
				npcHandler:say("Thank you! I look forward to reading this interesting discovery of yours and learn a few things about Zao. Let me share some experience with you.", cid)
				doPlayerAddExp(cid, 5000)
			end
		end
		Topic[cid] = 0
	elseif msgcontains(msg, "zao") and getPlayerStorageValue(cid, tomes) > 0 then
		local n = getPlayerStorageValue(cid, tomes)
		npcHandler:say(n == 1 and "I've learnt more about the lizard culture. It's really fascinating." or n == 2 and "I've learnt more about the minotaur culture. It's really fascinating." or n == 3 and "I've learnt more about the Draken culture by now. It's really fascinating." or n == 4 and "I've learnt something interesting about a certain food that the lizardmen apparently prepare." or n == 5 and "I've learnt something interesting about a city called Zzaion." or n == 6 and "I've learnt a few things about the primitive human culture on this continent." or n == 7 and "I've learnt something interesting about the Zao steppe." or n == 8 and "I've learnt a few things about an illness, or how I prefer to call it, 'corruption' of this land." or n == 9 and "I've learnt something interesting about the Draken origin." or n == 10 and "This book actually IS about Zao. Not about the continent, but about the mythical founder of the lizard dynasty." or n == 11 and "I've learnt something interesting about dragons and their symbolism." or n == 12 and "The last tome contained a lot of information about status symbols and insignia - such as thrones - and reveals some of the power structures in Zao." or n > 12 and "I've learnt many things from your books. Still, I guess that's just a fragment of what I could still discover about this interesting continent.", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "lizard") and getPlayerStorageValue(cid, tomes) >= 1 then
		npcHandler:say({"Did you know that the lizardmen were among the first races roaming this continent? They were waging war against the orcs, minotaurs and humans on Zao and for a long time it seemed that the forces were even. ...", "However, a while later, also a race of dragons arrived on this continent. Seeing the lizards as distant relatives, they decided to support their war, and together they drove all other races back into the steppe. ...", "It turned out though that the dragonkin didn't really view the lizards as allies but as servants and demanded gold and slaves for their help. Part of the lizard population agreed and obeyed their new masters, the others stirred up a violent rebellion. ...", "It doesn't really say what happened afterwards, but in the book were also pictures of special symbols the lizards use for their flags and banners. I've given this to Pompan. Maybe he can find a way to use it."}, cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "minotaur") and getPlayerStorageValue(cid, tomes) >= 2 then
		npcHandler:say({"Did you know that most of the minotaurs you might have met by now do not originally come from Zao? The original minotaur race stood no chance against the united force of dragons and lizards. ...", "Most of them were killed and captured, but a few of them were able to flee the continent. They found other minotaurs, mighty Mooh'Tah masters, and told them their story. ...", "The Mooh'Tah masters actually found the continent Zao and started to look for their lost brothers, but it doesn't say whether they actually found any survivors. ...", "In the tome, there was also a really nice pattern of a carrying device that might have been used by minotaurs. Or maybe by enemies of minotaurs. I've given it to Pompan. ...", "Maybe he can find a way to use it... we dwarfs are not that skilled when it comes to fashion."}, cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "draken") and getPlayerStorageValue(cid, tomes) >= 3 then
		npcHandler:say({"According to what I've read in that tome, the Draken seem to be a crossbreed between lizards and dragons, combining the dragons' strength with the lizards' swiftness. They seem to be the main figures in the dragons' internal quarrels. ...", "They can't fly and are stuck with walking on two feet, but else they combine the best of two worlds - they are intelligent, powerful and both strong magic users and skilled weapon wielders. ...", "Have you been to one of their settlements yet? They seem to have really beautifully adorned weapon racks. I've given a construction plan of such a rack to Esrik. Maybe he can recreate it."}, cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "food") and getPlayerStorageValue(cid, tomes) >= 4 then
		npcHandler:say({"I discovered an interesting recipe in this Tome of Knowledge. Maybe you've seen the large rice terraces in Muggy Plains - that is how the lizardmen apparently call that region. ...", "The book is a lot of blabla about how they cultivate and harvest their rice, but there's something we could actually learn, and that is a certain way to prepare that rice. ...", "If you ever come across a ripe rice plant, bring it to Swolt in the tavern and he might help you prepare it - grumpily."}, cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "zzaion") and getPlayerStorageValue(cid, tomes) >= 5 then
		npcHandler:say({"Have you ever seen the towers of the large lizard city south-east of Zao? It's the last one south of the mountains and who knows how long they are able to hold it. ...", "It's under constant and heavy siege by the steppe orcs and minotaurs. Sometimes they manage to crush the gates and storm the city. Watch out, you probably don't want to stumble right into the middle of a war. Or maybe you do? ...", "Anyway, I found another nice pattern in this book. It's for a lizard carrying device. I've given it to Pompan, just in case you're interested."}, cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "human") and getPlayerStorageValue(cid, tomes) >= 6 then
		npcHandler:say({"Well, to be honest it doesn't say much about humans in this book. However, it seems that the humans on this continent used to live in the steppe. ...", "In the great war against dragons and lizards, they didn't stand the slightest chance due to lack of equipment and well, let's face it, intelligence. The other races were superior in every way. ...", "They were driven back into the mountains and survived by growing mushrooms, collecting herbs and probably hunting smaller animals. Today, the orcs pose a major threat to them, so I guess they need every help they can possibly get. ...", "Anyway! The humans seem to make a so-called 'great hunt' now and then, and for that they play war instruments. If you're interested in drums or a didgeridoo and want to trade, let me know. I've recreated a few, they don't actually sound bad!"}, cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "steppe") and getPlayerStorageValue(cid, tomes) >= 7 then
		npcHandler:say({"Maybe you don't know that the great steppe was once a fertile ground. Well, to be precise - in the distant past it probably did not look any different from what it looks today. ...", "But when the lizard civilisation was at its peak, they apparently developed advanced irrigation systems to water the steppe and used this area as major source for their supplies on rice and other food. ...", "Back in those times, the lizard population was immense and their need of supplies tremendous. Therefore, they did not allow other races to co-exist and exterminated most of them almost completely. ...", "Some relics of the settlements of the pre-lizard cultures can still be found. Most of them were probably converted by the victorious lizardmen into something that suited their purposes better. ...", "All that talk about relics reminds me about something I've recently seen when getting some fresh air up in the mountains. Right next to the carpet pilot - may earth protect me from ever having to step on that thing - was an old lizard relic. ...", "Incredible how far their realm might have stretched at the peak of their civilisation! Time left its marks on the relic and I suppose it looks rather dangerous, but I am convinced that it is safe. You should try it out sometime."}, cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "corruption") and getPlayerStorageValue(cid, tomes) >= 8 then
		npcHandler:say({"You know, while all this talk about growing and preparing rice might sound boring, there are actually some bits of vital information hidden in all those lists. ...", "It seems that not only the loss of the southern area hampered the rice harvest of the lizards. ...", "Ever since the dragon kings established their reign, the harvest constantly got worse. And this is not all! It's reported that everything that is growing in this land experienced a fertility decrease. ...", "Even the lizards themselves seem to suffer from a population decline. It's widely blamed to a plague that ravaged the land in the past, but that seems unlikely given the fact that also plants and various animals were affected. ...", "Additionally, several plants changed in shape and became poisonous or toxic. Also, some new-born lizards seem to be affected by this. ...", "According to the descriptions, I'd call them mentally unstable, but their people see them as 'blessed by the dragon emperor'. I assume there are strange forces at work in this land, and I have a bad feeling about it. ...", "Anyway, you know what else was mentioned in this book? A path down to a hidden cave system below the Muggy Plains. ...", "Apparently, at first this system was used to hide - or rather to get rid of - new-born lizards that carried the sign of corruption - before the lizards decided to view it as a blessing. ...", "Who knows what happens down there now - maybe it's worth a look, maybe not. Maybe you won't even discover anything. In any case, be careful."}, cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "origin") and getPlayerStorageValue(cid, tomes) >= 9 then
		npcHandler:say({"I think the origin of the Draken sheds some new light on certain aspects of the lizard society. It is obvious from the books that the Draken appeared only after the dragon kings revealed themselves to the lizards. ...", "It is specifically mentioned that the tide of the battle turned when they joined the army of the lizards. Parts of the tome were obviously erased and later overwritten. ...", "In the parts of the original text that I was able to reconstruct with the help of some alchemy, there were some references to lizard spawns that were sighted in the Tiquanda area and linked to the snake god. ...", "Admittedly, it is just a hypothesis that is based on a few hints in these tomes and my correspondence about serpent spawns with the sage Edowir... ...", "...However, considering everything that I could figure out about their origin, they seem to hatch from the same eggs like ordinary lizardmen. ...", "It seems that some of those eggs are imbued with spiritual or magical power and as a result bear a serpent spawn. It appears that this changed when the dragon emperor became the ruler of this land. ...", "Unlike serpent spawns, the Draken hatched from some of the eggs in the hatcheries. ...", "I can only imagine what this might imply. As I said, it's only a theory, but I think a quite valid one and I'd treasure any additional information about that topic. ...", "In the meantime, I've also talked to Esrik about some information that I found in the tome concerning weaponry and armory. Knowing this dwarf, he might have some interesting offers for you by now."}, cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "founder") and getPlayerStorageValue(cid, tomes) >= 10 then
		npcHandler:say({"It seems that some parts of the tome are just copies from other sources and rather unrelated to each other. As far as I could piece them together, there was a mythical founder of the lizard civilisation. ...", "His name was Zao and his deeds and exploits are immortalised in lizard folklore. Some of the earliest records in the tomes suggest a slightly different story though. ...", "Many records talk about an early lizard dynasty, but I doubt that Zao was a single person born into that dynasty. ...", "My guess is that several members of this dynasty are responsible for or connected to the feats that were attributed to the mythical 'Zao'. ...", "The improbable lifespan of 'Zao' can thus be explained with the time the Zao dynasty reigned. On the other hand, we all know larger-than-life heroes did exist and some of them had an extremely long lifespan. ...", "Most likely, he also had children which could explain the mentioning of a Zao family. I think even the lizardmen don't know for sure what happened in such distant past and so this might be one of those riddles that will never be solved. ...", "It seems that the origin of the Zao dynasty was somewhere in the Dragonblaze Peaks, or rather under them. Legends tell of a large fortress, once erected up the highest peak, but now buried deep underground. Who knows, maybe you'll find answers there?"}, cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "dragon") and getPlayerStorageValue(cid, tomes) >= 11 then
		npcHandler:say({"Dragons are of great symbolism for this land. Even before the dragons came here and took control over Zao, the lizards worshipped the dragons as strong mythical beasts. ...", "When the future dragon kings came here - seemingly from a distant and foreign land - they probably took some advantage of this cult. ...", "Another symbol - that of the snake - that must have been much more popular than the dragon, faded into unimportance over the years. ...", "I think in the past, the lizardmen of this country might have worshipped a snake god or goddess just like their brethren in Tiquanda if we can believe the reports from this area. The dragons replaced the snake worship at some point of history. ...", "The reference to heretics and their extermination suggests that there might have been a rebellion against the dragons, which in turn hints at some close link between lizards and dragons, maybe a forced one. ...", "While reading this tome, I discovered a drawing of this beautiful statue. I was a skilled sculptor in the past, so I can't resist. ...", "I'm probably not that good anymore, but if you're interested and find me a red lantern, I could make one of those for you."}, cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "throne") and getPlayerStorageValue(cid, tomes) >= 12 then
		npcHandler:say({"In the modern lizard culture thrones seem to be only a reminiscent of the past. Whereas in the past the rulers of the lizardmen used thrones and other insignia to show their status, in our days they are ruled by dragon kings. ...", "Those kings seem to be massive dragons of immense power. Of course they do not actually 'use' thrones anymore, but claim them nonetheless as symbol for their position. ...", "From what I can tell, the lizards are bound to those dragon kings by some kind of magic. I'm not sure what this magic does, but I guess it ensures their loyalty to some extent. ...", "On an interesting side note - there were some hints in the tome that the dragon kings themselves are somehow bound to the dragon emperor through the same kind of magic. ...", "It seems this kind of liege system was formed sometime after the arrival of the dragons in this land. It's definitely an interesting field of research and shows us how much we still have to learn and to discover. ...", "Well, I've certainly learnt how the great old thrones look like. If you bring me some red cloth, I could probably try and reconstruct one for you."}, cid)
		Topic[cid] = 0

	elseif msgcontains(msg, "tribal crest") then
		npcHandler:say("You found a tribal crest, would you be kind enough to give me this?", cid)
		Topic[cid] = 4
	elseif Topic[cid] == 4 and msgcontains(msg, "yes") and doPlayerRemoveItem(cid, 11111, 1) == TRUE then
		doPlayerAddOutfit(cid,335, 2)
		doPlayerAddOutfit(cid,336, 2)
		npcHandler:say("Thanks for providing me with the tribal crest, take this addon in return!", cid)
		Topic[cid] = 0

	elseif msgcontains(msg, "serpent crest") then
		npcHandler:say("So you find a serpent crest, would you be kind enough to give me this?", cid)
		Topic[cid] = 5
	elseif Topic[cid] == 5 and msgcontains(msg, "yes") and doPlayerRemoveItem(cid, 11112, 1) == TRUE then
		doPlayerAddOutfit(cid,335, 1)
		doPlayerAddOutfit(cid,336, 1)
		npcHandler:say("Thanks for providing me with the serpent crest, take this flag addon in return!", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "lantern") and getPlayerStorageValue(cid, tomes) >= 11 then
		npcHandler:say("Have you brought me a red lantern for a dragon statue?", cid)
		Topic[cid] = 2
	elseif Topic[cid] == 2 and msgcontains(msg, "yes") and doPlayerRemoveItem(cid, 11200, 1) == TRUE then
		doPlayerAddItem(cid, 11127, 1)
		npcHandler:say("Let's put this little lantern here.. there you go. I wrap it up for you, just unwrap it in your house again!", cid)
		Topic[cid] = 0
	elseif msgcontains(msg, "cloth") and getPlayerStorageValue(cid, tomes) >= 12 and os.difftime(os.time(), getPlayerStorageValue(cid, clothTime)) >= 604800 then
		npcHandler:say("Have you brought me a piece of red cloth? I can make that throne for you if you want. But remember, I won't do that all the time - so try and don't destroy it, okay?", cid)
		Topic[cid] = 3
	elseif Topic[cid] == 3 and msgcontains(msg, "yes") and doPlayerRemoveItem(cid, 5911, 1) == TRUE then
		doPlayerAddItem(cid, 11199, 1)
		npcHandler:say("Let's put this cloth over the seat.. there you go. I wrap it up for you, just unwrap it in your house again!", cid)
		setPlayerStorageValue(cid, clothTime, os.time())
		Topic[cid] = 0
	elseif msgcontains(msg, "trade") and getPlayerStorageValue(cid, 85300) >= 6 then
		local items = {
			{name="war drum", id=3953, buy=1000},
			{name="didgeridoo", id=3952, buy=5000},
		}
		openShopWindow(cid, items,
			function(cid, itemid, subType, amount, ignoreCap, inBackpacks)
				customCallbackOnBuy(cid, itemid, subType, amount, ignoreCap, inBackpacks, items)
			end,
			function(cid, itemid, subType, amount, ignoreCap, inBackpacks)
				customCallbackOnSell(cid, itemid, subType, amount, ignoreCap, inBackpacks, items)
			end
		)
		npcHandler:say("Of course, just browse through my wares.", cid) -- buy fix 7gp
		Topic[talkUser] = 0
	end
	return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())