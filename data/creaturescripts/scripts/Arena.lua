function onPrepareDeath(cid)

-- INICIO CONFIG --
local a = {
l = {x=944,y=963,z=7}, -- canto superior esquerdo da arena
r = {x=952,y=957,z=7}, -- canto inferior direito da arena
e = {x=948,y=959,z=7} -- saida/local a ser teleportado quando "morre"
}
-- FINAL CONFIG --
local p = getCreaturePosition(cid) -- nao mexa

if isInRange(p, a.l, a.r) then
doSendMagicEffect(p, CONST_ME_STUN)
doTeleportThing(cid, a.e)
doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
doCreatureAddMana(cid, getCreatureMaxMana(cid))
return FALSE
end
return true
end