local keywordHandler = KeywordHandler:new()
        local npcHandler = NpcHandler:new(keywordHandler)
        NpcSystem.parseParameters(npcHandler)
        
        
        
        -- OTServ event handling functions start
        function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
        function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
        function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
        function onThink() 						npcHandler:onThink() end
        -- OTServ event handling functions end
        
        
        -- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
        local travelNode = keywordHandler:addKeyword({'cormaya'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Should I teleport you back to Pemaret?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33287, y=31956, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Maybe later.'})
			
			 local travelNode = keywordHandler:addKeyword({'back'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Should I teleport you back to Pemaret?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 0, destination = {x=33287, y=31956, z=6} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Maybe later.'})
			
        
        keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I teach some spells, provide one of the five blessings, and sell some amulets. Ask me for a {trade} if you like.'})
		
		-------------
		local node1 = keywordHandler:addKeyword({'fourth bless'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Here on the Eremo Island you may receive the blessing The Wisdom of Solitude. But we must ask of you to sacrifice 2000 gold. Are you still interested?'})
	node1:addChildKeyword({'yes'}, StdModule.bless, {npcHandler = npcHandler, number = 1, premium = true, baseCost = 2000, levelCost = 200, startLevel = 30, endLevel = 120})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Oh. You do not have enough money.'})
	
	local node2 = keywordHandler:addKeyword({'wisdom of solitude'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Here on the Eremo Island you may receive the blessing The Wisdom of Solitude. But we must ask of you to sacrifice 2000 gold. Are you still interested?'})
	node1:addChildKeyword({'yes'}, StdModule.bless, {npcHandler = npcHandler, number = 1, premium = true, baseCost = 2000, levelCost = 200, startLevel = 30, endLevel = 120})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Oh. You do not have enough money.'})
       

        npcHandler:addModule(FocusModule:new())