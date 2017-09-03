function onUse(cid,item,frompos,item2,topos)

	pos1 = {x = 344,y = 248,z = 7}
	pos2 = {x = 337,y = 248,z = 7}
      poscentro2 = {x = 335,y = 242,z = 7}
      poscentro1 = {x = 346,y = 242,z = 7}
	idbola = 2109
      tempo = 2*60*1000
	outfit1 = {lookType = 128, lookHead =  94, lookBody = 94, lookLegs = 94, lookFeet = 94, lookAddons = getCreatureOutfit(cid).lookAddons}
	outfit2 = {lookType = 128, lookHead =  0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookAddons = getCreatureOutfit(cid).lookAddons}
      time1 = getSpectators(pos1,2,0)
      time2 = getSpectators(pos2,2,0)
if getGlobalStorageValue(20003) == -1 then
setGlobalStorageValue(20003,1)
      if time1 then
         for i = 1,#time1 do
             doSetCreatureOutfit(time1[i], outfit1,tempo)
             doTeleportThing(time1[i],poscentro1)
         end
      end
      if time2 then
         for i = 1,#time2 do
             doSetCreatureOutfit(time2[i], outfit2,tempo)
             doTeleportThing(time2[i],poscentro2)
         end
      end
      doCreateItem(idbola,poscentro1)
      doBroadcastMessage("Começa o jogo!")
      addEvent(function()
      players = getSpectators(poscentro1,12,5)
      if players ~= nil then
         for i = 1,#players do
             doTeleportThing(players[i],pos1)
         end
      end
      doBroadcastMessage("Fim de jogo! O placar foi de: Time 1 "..getGlobalStorageValue(20000).." x "..getGlobalStorageValue(20001).." Time 2")
      setGlobalStorageValue(20000,0)
      setGlobalStorageValue(20001,0)
setGlobalStorageValue(20003,-1)
       end,tempo)                            
end
return TRUE
end