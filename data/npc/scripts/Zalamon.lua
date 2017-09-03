local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local storageChildren = 8823 -- Storagevalue Children of the Revolution Quest (finished = 2)
	local storageWrath = 42324 -- Storagevalue Wrath of the Emperor (finished = )
	local mark1 = {x = 33356,y = 31180, z = 7} -- First mark (entrance)(Wrath)
	local mark2 = {x = 33173,y = 31075, z = 7} -- Second mark (Wrath)
	
	--Josef part--
	local storage = getPlayerStorageValue(cid, 93800)
    local storagee = getPlayerStorageValue(cid, 93802)
	--Josef part--

	if (getPlayerStorageValue(cid,storageChildren) ~= 2) then
		--Josef part2--
		if msgcontains(msg, 'mission') then
			if (storage ~= 1) then
				npcHandler:say({'Zzo you are offering your help to a lizzard? Hmm, unuzzual. I don\'t know if I can fully truzzt you yet. ...', 'You\'ll have to work to earn my truzzt.'}, cid)
				setPlayerStorageValue(cid, 93800, 1)
			elseif (storagee == 1) then
				npcHandler:say('What newzz do you bring? Did you find any cluezz about zzeir whereaboutzz?', cid)
				talkState[talkUser] = 3		
			elseif (storagee == 5) then
				npcHandler:say({'If I\'m correct, zze portal in zze chamber beyond zze mechanizzm will lead you to zze great gate. It izz perfectly pozzible, however, zzat you will not be tranzzported directly into zze area. ...', 'You will razzer be brought to a plazze clozze by your goal. Where exzzactly, I cannot zzay. ...','Take all your courage and walk zze pazz zzrough zze portal. At leazzt TRY it - after all, I didn\'t make you my pupil for nozzing, '.. getCreatureName(cid) ..'. I hope you are prepared. ...', 'You did well on your quezzt zzo far. I hope you will reach zze great gate in time. If we are lucky, it will zztill be open. ...', 'If not, it will be already overrun by enemy zzoldierzz. Direct confrontation will be inevitable in zzat cazze, palezzkin. Now clear your mind and approach zze portal.'}, cid)
				setPlayerStorageValue(cid, 39721, 1)
				setPlayerStorageValue(cid, 93802, 7)
			elseif (storagee == 7) then
				if getPlayerStorageValue(cid, 8823) == 1 then
					npcHandler:say({'Too clozze, far too clozze. I felt a huge impact not long after you left. Zze war machinery of zze emperor muzzt finally have been zztarted. ...', 'I focuzzed and could only hope zzat I would reach you before everyzzing wazz too late. If I hadn\'t been able to tranzzport you here, our cauzze would have been lozzt. ...', 'I\'m afraid we cannot continue zzizz fight here today. Zze rezzizztanzze izz zztill fragile. I\'m afraid, zzere izz zztill much left to do. We\'ll have to prepare for war. ...', 'You\'ve helped uzz a great deal during zzezze dark hourzz, I\'ve got zzomezzing for you my friend. Pleazze, take zzizz zzerpent crezzt azz a zzign of my deep rezzpect. ...', 'Rezzt for now, you will need it - you have earned it.'}, cid)
					doPlayerAddItem(cid, 11112, 1)
					doPlayerAddExperience(cid, 10000)
					setPlayerStorageValue(cid, 8823, 2)
				end
			end 
		elseif msgcontains(msg, 'yes') and (talkState[talkUser] == 3) then
			npcHandler:say({'Aaah, zzezze look zzertainly interezzting. Zzezze manuzzcriptzz show uzz zzeveral locationzz of zze enemy troopzz. ...', 'I\'m imprezzed, zzoftzzkin. Maybe you can be of zzome more help.'}, cid)
			setPlayerStorageValue(cid, 93802, 5)
			talkState[talkUser] = 0
		end
		--Josef part2--
	else
		if (getPlayerStorageValue(cid,storageWrath) == 0) then
	
			if(msgcontains(msg, 'mission')) then
				npcHandler:say({'Zze attackzz have weakened our enemy zzignificantly. Yet, your quezzt continuezz. Bezzidezz zzome tazzkzz you could take, zze zzreat of zze {emperor} izz zztill hanging over our headzz like a rain cloud. ...','Zzo, are you indeed willing to continue zze fight for our cauzze?'}, cid)
				talkState[talkUser] = 1
		
			elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
				npcHandler:say({'You continue to imprezz, zzoftzzkin.','A contact of zze rezzizztanzze izz located furzzer in zze norzz of Zao.','Zze emperor will drag hizz forzzezz to zze {great gate}  now to bolzzter hizz defenzze. Zzinzze we attacked zze gate directly, he will not expect uzz taking a completely different route to reach zze norzzern territoriezz. ...','I azzume you are already geared up and ready to conquer zze norzz?'}, cid)
				talkState[talkUser] = 2
		
			elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 2) then	
				npcHandler:say({'Your determination izz highly appreciated. To zzneak pazzt zze eyezz of zze enemy, you will have to uzze a diverzzion. Zzere are zzeveral old {tunnelzz}h beneazz zze zzoil of Zzao. ...','One of zzem izz uzzed azz a maintenanzze connection by enemy lizardzz. To enter it, you will have to uzze a dizzguizze. Zzomezzing like a crate perhapzz.','Mh, if you can find zzome nailzz - 3 should be enough - and 1 piezze of wood, I should be able to create an appropriate cazzing. Return to me if you found zze itemzz and we will talk about zze next zztep.'}, cid)
				talkState[talkUser] = 0
				setPlayerStorageValue(cid,storageWrath,1)
		
			end
		
		elseif (getPlayerStorageValue(cid,storageWrath) == 1) then
		
			if(msgcontains(msg, 'mission')) then
				npcHandler:say({'Ah you have returned. I azzume you already found zzome itemzz to {build} a proper dizzguizze?'}, cid)
				talkState[talkUser] = 1
			
			elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
				if(getPlayerItemCount(cid, 5901) >= 1 and getPlayerItemCount(cid, 8309) >= 3) then
					npcHandler:say({'Very good, I am confident zzizz will zzuffizze. Now I can {build} and mark a {crate} large enough for you to fit in - while zztill being able to breazze of courzze - and I will mark it in our tongue zzo it will look lezz zzuzzpizziouzz. ...','Wizz zzeir eyezz towardzz zze {gate}, your chanzzezz to zzlip zzrough have never been better. I will keep zze zzpare materialzz here wizz me, we can alwayzz {build} a new one if you need to.'}, cid)
					talkState[talkUser] = 2
				else	
					npcHandler:say({'Mh, if you can find zzome nailzz - 3 should be enough - and 1 piezze of wood, I should be able to create an appropriate cazzing. Return to me if you found zze itemzz and we will talk about zze next zztep.'}, cid)
				end
			elseif(msgcontains(msg, 'crate') and talkState[talkUser] == 2) then		
				npcHandler:say({'Ah I zzee. You are ready for your mizzion and waiting for me to create and mark zze crate?'}, cid)
				talkState[talkUser] = 3
			
			elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 3) then		
				npcHandler:say({'Alright. Let uzz create a crate. Hm. Let me zzee.','Good. Zzat will do. ...','Zze maintenanzze tunnelzz are in zze eazzt of zze plainzz, near ze coazt. Here, I will mark zzem on your map.','Uzze zze dizzguizze wizzely, try to hide in zze dark and avoid being zzeen at all cozzt. ...','Onzze you have reached zze norzz, you can find zze rezzizztanzze hideout at zze ozzer zzpot I marked on your map. Now hurry.'}, cid)
				if doPlayerRemoveItem(cid,5901,1) and doPlayerRemoveItem(cid,8309,3) then
					doPlayerAddItem(cid,12245,1)
					setPlayerStorageValue(cid,storageWrath,2)
					doPlayerAddMapMark(cid, mark1, MAPMARK_CROSS, 'Maintenance Tunnel Entry')
					doPlayerAddMapMark(cid, mark2, MAPMARK_CROSS, 'Resistance Hideout')
					talkState[talkUser] = 0
				end	
			end
		
		end
		
	end
	
	return true
	
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())