-- SpellCreator generated.

-- =============== COMBAT VARS ===============
-- Areas/Combat for 0ms
local combat0_Manadrain = createCombatObject()
setCombatParam(combat0_Manadrain, COMBAT_PARAM_EFFECT, CONST_ME_SOUND_WHITE)
setCombatParam(combat0_Manadrain, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatArea(combat0_Manadrain,createCombatArea({{0, 0, 0, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 2, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 0, 0, 0}}))
function getDmg_Manadrain(cid, level, maglevel)
	return (2*maglevel+500+level/3)*-1,(3*maglevel+500+2*level/10)*-1 
end
setCombatCallback(combat0_Manadrain, CALLBACK_PARAM_LEVELMAGICVALUE, "getDmg_Manadrain")

-- =============== CORE FUNCTIONS ===============
local function RunPart(c,cid,var,dirList,dirEmitPos) -- Part
	if (isCreature(cid)) then
		doCombat(cid, c, var)
		if (dirList ~= nil) then -- Emit distance effects
			local i = 2;
			while (i < #dirList) do
				doSendDistanceShoot(dirEmitPos,{x=dirEmitPos.x-dirList[i],y=dirEmitPos.y-dirList[i+1],z=dirEmitPos.z},dirList[1])
				i = i + 2
			end		
		end
	end
end

function onCastSpell(cid, var)
	local startPos = getCreaturePosition(cid)
	RunPart(combat0_Manadrain,cid,var)
	return true
end