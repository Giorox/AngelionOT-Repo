local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -20, -1, -30, 5, 5, 2.3, 4)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
