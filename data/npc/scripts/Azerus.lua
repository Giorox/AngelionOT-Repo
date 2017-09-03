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
    local namee = getPlayerName(cid)

    if(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102500) < 1 then
        selfSay('Well, what can I say? You have to make a decision. You have seen the differences between my goals and those of Palimuth. Make up your mind, but choose wisely! But firstly go to {Palimuth} and talk with him.', cid)
        setPlayerStorageValue(cid, 102501, 1)

    elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102500) == 1 and getPlayerStorageValue(cid,102501) <= 1 then
        selfSay('Well, what can I say? You have to make a decision. You have seen the differences between my goals and those of Palimuth. Make up your mind, but choose wisely!', cid)
        setPlayerStorageValue(cid, 102500, 2)
        setPlayerStorageValue(cid, 102501, 1)

    elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102500) == 1 and getPlayerStorageValue(cid,102501) > 1 then
        selfSay('Well, what can I say? You have to make a decision. You have seen the differences between my goals and those of Palimuth. Make up your mind, but choose wisely!', cid)
        setPlayerStorageValue(cid, 102500, 2)


    elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102501) >= 1 and getPlayerStorageValue(cid,102501) < 3 and getPlayerStorageValue(cid,102501)>= 1 and getPlayerStorageValue(cid,102501) < 3 then
        selfSay('So do you want to side with me ' ..namee.. ' ?', cid)
            talkState[talkUser] = 1


    elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102500) == 4  then
        selfSay('You Fool! How could you refuse my offer! Get out of my sight!', cid)


    elseif((msgcontains(msg, 'yes') or msgcontains(msg, 'tak')) and talkState[talkUser] == 1) then
            selfSay('I knew that you were smart enough to make the right decision! Your next {mission} will be a special one!', cid)
            setPlayerStorageValue(cid, 102501, 3)
            setPlayerStorageValue(cid, 102500, 3)
            setPlayerStorageValue(cid, 102503, 1)
            talkState[talkUser] = 0
    

    elseif((msgcontains(msg, 'nie') or msgcontains(msg, 'no')) and talkState[talkUser] == 1) then
            selfSay('Remember to choose Wisely!.', cid)
            talkState[talkUser] = 0


    elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102503) == 2 then
        selfSay('Come hurry to inner sanctum, and help us in ceremonial!', cid)
        setPlayerStorageValue(cid, 102505, 1)
    elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102503) == 4 then
        selfSay('Please Forgive Me!', cid)

    elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102502) == 4 then
        selfSay('I went so far... Please Forgive Me!', cid)

    elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102502) == 3 then
        selfSay('It was my fault... Go to Palimuth. Say him that i am sorry...', cid)


    elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102503) == 1 then
        setPlayerStorageValue(cid, 58260, 1)
        setPlayerStorageValue(cid, 102503, 2)
        setPlayerStorageValue(cid, 102505, 1)
    local msgs={
            "For your noble deeds, we would like to invite you to a special celebration ceremony. ...",
            "Only the most prominent Yalahari are allowed to join the festivities. I assume you can imagine what honour it is that you have been invited to join us. Meet us in the inner cities centre. ...",
            "As our most trusted ally, you may pass all doors to reach the festivity hall. There you will receive your reward for the achievements you have gained so far. ...",
            "I'm convinced your reward will be beyond your wildest dreams. And that is just the beginning!"
            }
      doNPCTalkALot(msgs,9000) --if the 2750 is ommited, it uses 3000 always

    elseif(msgcontains(msg, 'Mission') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,102503) == 3 then
        setPlayerStorageValue(cid, 102503, 4)
        setPlayerStorageValue(cid, 102505, -1)

        setPlayerStorageValue(cid, 58266, 1)
                    doPlayerAddOutfit(cid,324,2)
                    doPlayerAddOutfit(cid,325,2)
    local msgs1={
            "I am sorry... I am really sorry. We were wrong... No! The only one who was wrong was me. ...",
            "I know that you won't forgive me, but i want to give you something, in evidence of apologizing. ...",
            "Please, take this Yalaharian Addon, to your outfit, You can also choose one of three rewards in room on right. ...",
            "I know that it is not much, but please... Forgive me!"
            }
      doNPCTalkALot(msgs1,7000) --if the 2750 is ommited, it uses 3000 always
    end

    return TRUE    
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  