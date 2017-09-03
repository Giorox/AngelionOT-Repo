local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)       npcHandler:onCreatureAppear(cid)       end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)       end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()         npcHandler:onThink()             end

function creatureSayCallback(cid, type, msg)
     if not npcHandler:isFocused(cid) then
         return false
     end

     local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

     if msgcontains(msg, "theories") and getPlayerStorageValue(cid, 7440) == -1 then
         selfSay("My research on the Tiblia led me to big sources of knowledge on many characters of early history: great heroes, gods and demigods, but what interested me were only a few, more specifically the {first 4}.", cid)
         talkState[talkUser] = 1
	 elseif msgcontains(msg, "first 4") and talkState[talkUser] == 1 then
         selfSay("The first 4, are what we call the godfathers of the vocation system that we make use of today: Banor, Crunor, Elane and Kirana.", cid)
         talkState[talkUser] = 0
		 setPlayerStorageValue(cid, 7440, 1)
	 end
  
     if msgcontains(msg, "first 4") and getPlayerStorageValue (cid, 7440) == 1 then
        selfSay("They were Banor, Crunor, Elane and Kirana, the ones we call the Vocation Masters.", cid)
		selfSay("These Vocation Masters are so important in our culture that, to any city you go, you will see at least one of their statues, and that's why I was researching them. But the {specifics} are something I would have to explain.", cid)
		talkState[talkUser] = 1
	 elseif msgcontains(msg, "specifics") and talkState[talkUser] == 1 and getPlayerStorageValue (cid, 7440) == 1 then
	    selfSay("You really are interested in this, aren't you? Very well.", cid)
	    selfSay("These Vocation Masters weren't ordinary humans, nor where they gods, demons or any species that we know off..They were {demigods}.", cid)
		talkState[talkUser] = 2
	 elseif msgcontains(msg, "demigod") and talkState[talkUser] == 2 and getPlayerStorageValue (cid, 7440) == 1 then
		selfSay("You know, half human half god? They were each created from the goodwill of the gods and the body of a human woman...Anyways, the thing about demigods, or specifically these demigods, is that they're generally buried differently.", cid)
		selfSay("Well, not so much as buried, as entombed. Entombed in a way that their very souls are stuck to their crypt. This becomes troublesome because there are creatures and humans very capable of messing with the dead and their souls, {necromancers}.", cid)
		talkState[talkUser] = 3
	 elseif msgcontains (msg, "necromancer") and talkState[talkUser] == 3 and getPlayerStorageValue (cid, 7440) == 1 then
		selfSay("Necromancy is the art of reanimating the dead through means of soul enslavement, because of this, there was a very real chance that if the crypt {sites} were discovered, that forces of evil, be it necromancers or otherwise, would try to reanimate the Masters.", cid)
		setPlayerStorageValue(cid, 7441, 1)
		talkState[talkUser] = 0
	 end	

	 if msgcontains(msg, "site") and getPlayerStorageValue (cid, 7441) == 1 then
		selfSay("Each crypt site has it's own place and dimension and because of that, means of getting to it are hard and dangerous, dimensional travel can get...messy.", cid)
        selfSay("Although, if you're brave enough, I still have most of my research memorized and I might be able to lead you to them one by one. Do you wish to go forth with this task?", cid)
		setPlayerStorageValue (cid, 7442, 1)
		talkState[talkUser] = 1
	 end

	 if msgcontains(msg, "yes") and getPlayerStorageValue (cid, 7442) == 1 and talkState[talkUser] == 1 then
	    selfSay("Very well, let us proceed to the first one, Elane, also known as Queen of the Paladins, let me collect my thoughts and I'll {brief} you.", cid)
		setPlayerStorageValue (cid, 7443, 1)
		talkState[talkUser] = 0
	 elseif msgcontains(msg, "no") and getPlayerStorageValue (cid, 7442) == 1 then
		selfSay("Come back to me when you're ready.", cid)
	 end

	 if msgcontains(msg, "brief") and getPlayerStorageValue (cid, 7443) == 1 then
		selfSay("Elane, Queen of the Paladins, regarded as the most skilled archer of all time, she was the one that taught the elves..Because of that, her crypt is in Ab'Dendriel, most likely in the library. Although there's a {catch}.", cid)
	    talkState[talkUser] = 1
	 elseif msgcontains(msg, "catch") and getPlayerStorageValue (cid, 7443) == 1 and talkState[talkUser] == 1 then
		selfSay("Elane has probably set monsters guarding her crypt, but even then she won't be as docile as she used to be in life, that's because demon necromancers from the Pits of Inferno have tempered with all of the Master's crypt..So, good luck.", cid)
		setPlayerStorageValue (cid, 7444, 1)
		talkState[talkUser] = 2
     end	
	 
	 if msgcontains(msg, "mission") and getPlayerStorageValue (cid, 7445) == 1 then
		selfSay("Yes, I felt it, you did free Elane's spirit, a job well done might I say so myself. When you're ready for the next ask me about the {next} one.", cid)
		setPlayerStorageValue (cid, 7446, 1)
	 elseif msgcontains(msg, "mission") and getPlayerStorageValue (cid, 7445) == -1 and getPlayerStorageValue (cid, 7444) == 1 and	talkState[talkUser] == 2 then
		selfSay("Not quite, I can still feel the curse", cid)
	 end	
	 
	 if msgcontains(msg, "next") and getPlayerStorageValue (cid, 7446) == 1 then
		selfSay("Kirana was a very powerful mage and researcher working for the Edron academy initially and later doing her own research in a {lab} setup somewhere in Cormaya.", cid)
		talkState[talkUser] = 3
	 elseif msgcontains(msg, "lab") and getPlayerStorageValue (cid, 7446) == 1 and	talkState[talkUser] == 3 then
		selfSay("As I said, somewhere on Cormaya Island Kirana setup her private lab, where she also lived for the longest time, It's probably a little beaten up, but nothing you should need to worry about. Good Luck!", cid)
		setPlayerStorageValue (cid, 7447, 1)
		setPlayerStorageValue (cid, 7445, -1)
	 end
	 
	 if msgcontains(msg, "mission") and getPlayerStorageValue (cid, 7448) == 1 then
		selfSay("Oh yes, the silence of eternal rest is once again heard by Kirana. Once you've get setup, ask me about the {next} one.", cid)
		setPlayerStorageValue (cid, 7449, 1)
	 elseif msgcontains(msg, "mission") and getPlayerStorageValue (cid, 7448) == -1 and getPlayerStorageValue (cid, 7447) == 1 and	talkState[talkUser] == 3 then
		selfSay("I can still hear Kirana's screams..", cid)
	 end
	 
	 if msgcontains(msg, "next") and getPlayerStorageValue (cid, 7449) == 1 then
		selfSay("Crunor was the first ever Druid, he paved the way for all the teachings and ideals of Druids, as such he secluded himself from contact with urban settlements and figures, his safe {haven} is said to be somewhere near the Pits Of Inferno.", cid)
		talkState[talkUser] = 4
	 elseif msgcontains(msg, "haven") and getPlayerStorageValue (cid, 7449) == 1 and talkState[talkUser] == 4 then
		selfSay("Yes, the place where he secluded himself to get closer to nature and to meditate, it is said he was very powerful with the elements and as such was entrusted to safeguard the entrance to the Pits Of Inferno, so nothing came in..or out...", cid)
		setPlayerStorageValue (cid, 7450, 1)
		setPlayerStorageValue (cid, 7448, -1)
	 end
	 
	 if msgcontains(msg, "mission") and getPlayerStorageValue (cid, 7451) == 1 then
		selfSay("Yes yes, the animals have come back to their usual selves. Once you're ready ask me about the {next} one.", cid)
		setPlayerStorageValue (cid, 7452, 1)
	 elseif msgcontains(msg, "mission") and getPlayerStorageValue (cid, 7451) == -1 and getPlayerStorageValue (cid, 7450) == 1 and	talkState[talkUser] == 4 then
		selfSay("No, the animals are still acting strangely..", cid)
	 end
	 
	 if msgcontains(msg, "next") and getPlayerStorageValue (cid, 7453) == 1 then
		selfSay ("Banor was the first to wield the meele weapons, the first to master the strokes and the slashes, the one that founded Edron..As such his grave is set in one of the {cemeteries} in Edron.", cid)
		talkState[talkUser] = 5
	 elseif msgcontains(msg, "cemeteries") and getPlayerStorageValue (cid, 7453) == 1 and talkState[talkUser] == 1 then
		selfSay("There are more than one cemetery in Edron, one of them north of the river and the mountain pass that devides the wilderness from the civilized area. That's where you will find his grave. Good Luck!", cid)
		setPlayerStorageValue (cid, 7454, 1)
		setPlayerStorageValue (cid, 7451, -1)
	 end
	 
	 if msgcontains(msg, "mission") and getPlayerStorageValue (cid, 7455) == 1 then
		selfSay("Indeed, it seems the necromantic essence is dying down near his tomb..I'm cutting some loose ends, ask me about your {reward} later.", cid)
		setPlayerStorageValue (cid, 7456, 1)
	 elseif msgcontains(msg, "mission") and getPlayerStorageValue (cid, 7455) == -1 and getPlayerStorageValue (cid, 7454) == 1 and	talkState[talkUser] == 5 then
		selfSay("There is a lot of necromantic presence near his grave still....", cid)
	 end
	 
	 if msgcontains(msg, "reward") and getPlayerStorageValue (cid, 7456) == 1 then
		selfSay("Oh yes, your reward, after helping me so tremendously and being through dimensional travel and beating the Vocation Masters...well weakened versions. The {location} of your reward is also in a very secluded place.", cid)
		talkState[talkUser] = 6
	 elseif msgcontains(msg, "location") and getPlayerStorageValue (cid, 7456) == 1 and talkState[talkUser] == 6 then
		selfSay("I say secluded, but that doesn't mean far, just north of here, you'll find a hole, just go down it and get your prize, be mindful you can only choose one.", cid)
		setPlayerStorageValue (cid, 7457, 1)
		talkState[talkUser] = 0
	 end	
	 return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())