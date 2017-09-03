local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local fire = createConditionObject(CONDITION_FIRE)
addDamageCondition(fire, 10, 2000, -10)
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
local condition = createConditionObject(CONDITION_FIRE)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 10, 2000, -10)
setCombatCondition(combat, condition)

function onCreatureSay(cid)
 
    if (getDistanceToCreature(cid) <= 3) and isPlayer(cid) == TRUE then
        selfSay("Die, intruder!")
        doTargetCombatCondition(0, cid, fire, 4)
        doSendMagicEffect(getThingPos(getNpcCid()), CONST_ME_YELLOW_RINGS)
    end
 
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())