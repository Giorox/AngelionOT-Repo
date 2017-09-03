local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local Topic = {}
 
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end
 
    function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    elseif msgcontains(msg, 'thais') then
        selfSay('Do you want to sail to Thais?', cid)
        Topic[cid] = 1
    elseif Topic[cid] == 1 then
        if msgcontains(msg, 'yes') then
            if isPremium(cid) then
                if not isPlayerPzLocked(cid) then
                    local pos = math.random(10) == 5 and {x=32160, y=32553, z=6} or {x=32310, y=32210, z=6}
                    selfSay('Set the sails!', cid)
                    npcHandler:releaseFocus(cid)
                    doSendMagicEffect(getThingPos(cid), CONST_ME_TELEPORT)
                    doTeleportThing(cid, pos)
                    doSendMagicEffect(pos, CONST_ME_TELEPORT)
                else
                    selfSay('First get rid of those blood stains! You are not going to ruin my vehicle!', cid)
                end
            else
                selfSay('I\'m sorry, but you need a premium account in order to travel onboard our ships.', cid)
            end
        else
            selfSay('We would like to serve you some time.', cid)
        end
        Topic[cid] = 0
    end
    return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())