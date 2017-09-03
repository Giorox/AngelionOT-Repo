local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
-- OTServ event handling functions start
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                         npcHandler:onThink() end
-- OTServ event handling functions end


function doCreatureSayWithDelay(cid,text,type,delay,e)
   if delay<=0 then
      doCreatureSay(cid,text,type)
   else
      local func=function(pars)
                    doCreatureSay(pars.cid,pars.text,pars.type)
                    pars.e.done=TRUE
                 end
      e.done=FALSE
      e.event=addEvent(func,delay,{cid=cid, text=text, type=type, e=e})
   end
end

--returns how many msgs he have said already
function cancelNPCTalk(events)
  local ret=1
  for aux=1,table.getn(events) do
     if events[aux].done==FALSE then
        stopEvent(events[aux].event)
     else
        ret=ret+1
     end
  end
  events=nil
  return(ret)
end


function doNPCTalkALot(msgs,interval)
  local e={}
  local ret={}
  if interval==nil then interval=3000 end --3 seconds is default time between messages
  for aux=1,table.getn(msgs) do
      e[aux]={}
      doCreatureSayWithDelay(getNpcCid(),msgs[aux],TALKTYPE_PRIVATE_NP,(aux-1)*interval,e[aux])
      table.insert(ret,e[aux])
  end
  return(ret)
end


function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid


    if(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102501) < 1 then
        selfSay('Well, what can I say? You have to make a decision. You have seen the differences between my goals and those of Azerus. Make up your mind, but choose wisely! Go to {Azerus} talk with him, before you choose.', cid)
        setPlayerStorageValue(cid, 102500, 1)

    elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102501) == 1 and getPlayerStorageValue(cid,102500) <= 1 then
        selfSay('Well, what can I say? You have to make a decision. You have seen the differences between my goals and those of Azerus. Make up your mind, but choose wisely!', cid)
        setPlayerStorageValue(cid, 102500, 1)
        setPlayerStorageValue(cid, 102501, 2)

    elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102501) == 1 and getPlayerStorageValue(cid,102500) > 1 then
        selfSay('Well, what can I say? You have to make a decision. You have seen the differences between my goals and those of Azerus. Make up your mind, but choose wisely!', cid)
        setPlayerStorageValue(cid, 102501, 2)

    elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102501) >= 1 and getPlayerStorageValue(cid,102501) < 3 and getPlayerStorageValue(cid,102501)>= 1 and getPlayerStorageValue(cid,102501) < 3 then
        selfSay('So do you want to side with me?', cid)
            talkState[talkUser] = 1

    elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102500) == 3 then
        selfSay('I Am really disappointed. How could you join azerus?! Get off my sight!', cid)


    elseif((msgcontains(msg, 'yes') or msgcontains(msg, 'tak')) and talkState[talkUser] == 1) then
            selfSay('I knew that you make a right decision. I have for you another {mission}', cid)
            setPlayerStorageValue(cid, 102502, 1)
            setPlayerStorageValue(cid, 102501, 4)
            setPlayerStorageValue(cid, 102500, 4)
                talkState[talkUser] = 0
    

    elseif((msgcontains(msg, 'nie') or msgcontains(msg, 'no')) and talkState[talkUser] == 1) then
            selfSay('Remember to choose Wisely!.', cid)
            talkState[talkUser] = 0


    elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102502) == 2 then
        selfSay('Go Stop Azerus! There is no Time!', cid)

    elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102503) == 3 then
        selfSay('I am really glad that you defeated Azerus. Go to talk with him.', cid)

    elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102503) == 4 then
        selfSay('Azerus understood that he do not have any chances to control Evil. I am glad that You have helped him understood.', cid)

    elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102502) == 1 then
    setPlayerStorageValue(cid, 102504, 1)
    setPlayerStorageValue(cid, 102502, 2)
        setPlayerStorageValue(cid, 58260, 1)

    local msgs={"I cannot tell you how we acquired this information, but we have heard that a circle of Yalahari is planning some kind of ritual. ...","They plan to create a portal for some powerful demons and to unleash them in the city to 'purge' it once and for all. ...","I doubt those poor fools will be able to control such entities. I can not figure out how they came up with such an insane idea, but they have to be stopped. ...","The entrance to their inner sanctum has been opened for you. Please hurry and stop them before it is too late. Be prepared for a HARD battle! Better gather some friends to assist you."}
      doNPCTalkALot(msgs,8000) --if the 2750 is ommited, it uses 3000 always



    elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102502) == 3 then
    setPlayerStorageValue(cid, 102502, 4)
    setPlayerStorageValue(cid, 102504, -1)
    setPlayerStorageValue(cid, 58266, 1)
        doPlayerAddOutfit(cid,324,1)
        doPlayerAddOutfit(cid,325,1)
    local msgs={
            "Thanks God that they sent you to us. Because of you we can normally sleep. Let me remunerate you. ...",
            "You get possibility to wear our addon to your Yalaharian Outfit. Centraily it looks great at you. ...",
            "Futhermore, you can choose one of rewards in room inside castle. As i want to tellin' this, i will repeat one more time. Choose wisely!"
             }
      doNPCTalkALot(msgs,6500) --if the 2750 is ommited, it uses 3000 always

    elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102502) == 4 then
        selfSay('Azerus understood that he do not have any chances to control Evil. I am glad that You have helped him understood.', cid)

end
    return TRUE    
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  