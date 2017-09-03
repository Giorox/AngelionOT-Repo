local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

local Topic = {}
local storage = 8647

function onCreatureAppear(cid)        npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg) end
function onThink()             npcHandler:onThink() end

function greetCallback(cid)
  local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  Topic[talkUser] = 0
    return true
end

function creatureSayCallback(cid, type, msg)

  if(not npcHandler:isFocused(cid)) then
    return false
  end

  local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
  if msgcontains(msg, "yes") and Topic[talkUser] == 1 and getPlayerStorageValue(cid, storage) < 1 then
    npcHandler:say("I grant you ze permizzion to enter ze arena. Remember, you'll have to enter ze arena az a team of two. If you are not familiar wiz ze rulez, I can explain zem to you once again. ", cid)
    setPlayerStorageValue(cid, storage, 1)
    Topic[talkUser] = 0
  elseif msgcontains(msg, "battle") and getPlayerStorageValue(cid, storage) < 1 then
    npcHandler:say("Zo you want to enter ze arena, you know ze rulez and zat zere will be no ozer option zan deaz or victory?", cid)
    Topic[talkUser] = 1
  elseif msgcontains(msg, "tournament") or msgcontains(msg, "arena") then
    npcHandler:say({"Ze tournament iz ze ultimate challenge of might and prowrezz. Ze rulez may have changed over ze centuriez but ze ezzence remained ze zame. ...", "If you know ze rulez, you might enter ze arena for ze battle."}, cid)
    Topic[talkUser] = 0
  elseif msgcontains(msg, "rulez") then
    npcHandler:say({"I waz informed zat you were zent to fight for one of ze mozt preztigiouz officialz of ze court. According to ze rulez, ziz zponzorzhip allowz you to participate in ze tournament. ...", "While in ze pazt, ze tournament waz ztrictly non-leazal, ze ztakez have raized conziderably nowadayz. Zo lizten clozely: You will enter ze tornament az a team! ...", "Two of you muzt have gotten ze permizzion to enter ze arena. Zen you have to ztand on ze platformz in ze back and one of you haz to pull ze lever. You will be tranzported into ze arena. ...", "Once you enter, zere will only be victory or deaz! You have to be aware zat zere will be no chance to flee ze combat! Firzt you will face one team of opponentz. ...", "You don't have long to defeat zem becauze zoon anozer team will enter ze fight. Az outziderz you will certainly be ze target of zeir concentrated attackz, zo it iz advizable to get rid of your opponentz az quickly az pozzible. ...", "You might even gain zome time to regroup and tend your woundz if you are quick. After fighting zix teamz, you will have to face ze current champion of ze arena of ztrive. ...", "If you manage to defeat him, your mazter winz ze tournament and all honourz. Zo if you feel prepared for ze battle, you can azk me to enter ze arena any time."}, cid)
    Topic[talkUser] = 0
  end
  return TRUE
end

npcHandler:setMessage(MESSAGE_GREET, "Greetingz, competitor.")
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
