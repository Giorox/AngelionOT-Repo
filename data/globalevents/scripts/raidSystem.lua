--Unannounced Boss Raid Sytem
--Script by Giorox

raidTable = {
	{boss = "Fernfang", pos = {x=32851,y=32339,z=6}},
	{boss = "Captain Jones", pos = {x=33276,y=32215,z=7}},
	{boss = "Rukor Zad", pos = {x=32602,y=32383,z=10}},
	{boss = "Yaga The Crone", pos = {x=32716,y=32009,z=11}},
	{boss = "Zarabustor", pos = {x=32509,y=31582,z=14}},
	{boss = "Zevelon Duskbringer", pos = {x=32754,y=31578,z=11}},
	{boss = "The Evil Eye", pos = {x=32798,y=31668,z=14}},
	{boss = "General Murius", pos = {x=32428,y=32113,z=15}},
	{boss = "Warlord Ruzad", pos = {x=32970,y=31722,z=5}},
	{boss = "Rotworm Queen", pos = {x=32774,y=31601,z=12}}, -- Hellgate
	{boss = "Rotworm Queen", pos = {x=33237,y=31842,z=9}}, -- Rotworm Cave (Edron)
	{boss = "Rotworm Queen", pos = {x=32263,y=32688,z=10}}, -- Rotworm Cave (Vandura)
	{boss = "Rotworm Queen", pos = {x=33305,y=32329,z=9}}, -- Rotworm Cave (Darashia)
	{boss = "Grorlam", pos = {x=32030,y=32687,z=13}},
	{boss = "Diblis The Fair", pos = {x=32009,y=32795,z=10}},
	{boss = "Arachir The Ancient One", pos = {x=32965,y=32400,z=12}},
	{boss = "Sir Valorcrest", pos = {x=33264,y=31768,z=10}},
	{boss = "The Horned Fox", pos = {x=32463,y=31954,z=4}},
	{boss = "Necropharus", pos = {x=33044,y=32401,z=10}}, -- Medusa Shield Quest
	{boss = "Necropharus", pos = {x=33082,y=31674,z=11}}, -- Edron Hero Cave
	{boss = "Necropharus", pos = {x=31963,y=32592,z=10}}, -- Lich Hell
	{boss = "Demodras", pos = {x=32776,y=32289,z=10}}, -- POH DLair
	{boss = "Demodras", pos = {x=32793,y=32337,z=12}}, -- POI Dlair
	{boss = "Demodras", pos = {x=32352,y=32091,z=10}}, -- Thais DLair
	{boss = "Demodras", pos = {x=33236,y=32277,z=12}}, -- Darashia DLair
	{boss = "Demodras", pos = {x=32876,y=32154,z=9}}, -- Venore DLair
	{boss = "Dracola", pos = {x=32837,y=32309,z=15}},
	{boss = "The Imperor", pos = {x=32904,y=32217,z=15}},
	{boss = "The Plasmother", pos = {x=32844,y=32332,z=15}},
	{boss = "The Handmaiden", pos = {x=32785,y=32276,z=15}},
	{boss = "Massacre", pos = {x=32877,y=32271,z=15}},
	{boss = "Countess Sorrow", pos = {x=32803,y=32333,z=15}},
	{boss = "Mr. Punish", pos = {x=32763,y=32243,z=15}},
	{boss = "Yeti", pos = {x=32011,y=31595,z=7}},
	{boss = "Barbaria", pos = {x=32022,y=31395,z=7}},
	{boss = "Gravelord Oshuran", pos = {x=32897,y=32437,z=11}},
	{boss = "Tiquandas Revenge", pos = {x=32872,y=32665,z=7}},
	{boss = "High Templar Cobrass", pos = {x=32957,y=32854,z=8}},
	{boss = "Hatebreeder", pos = {x=33045,y=31093,z=14}},
	{boss = "Flamecaller Zazrak", pos = {x=33184,y=31220,z=7}},
	{boss = "Dreadmaw", pos = {x=33294,y=31159,z=7}},
	{boss = "Battlemaster Zunzu", pos = {x=33204,y=31356,z=7}},
	{boss = "The Voice of Ruin", pos = {x=33311,y=31130,z=9}},
	{boss = "Munster", pos = {x=32100,y=32217,z=9}},
	{boss = "Rottie the Rotworm", pos = {x=32059,y=32076,z=10}}, -- Poison Spider Cave
	{boss = "Rottie the Rotworm", pos = {x=32174,y=32147,z=11}}, -- Katana Quest
	{boss = "Teleskor", pos = {x=31976,y=32248,z=10}},
	{boss = "Apprentice Sheng", pos = {x=32129,y=32060,z=12}},
	{boss = "Dharalion", pos = {x=33039,y=32177,z=9}},
	{boss = "Man In The Cave", pos = {x=32133,y=31147,z=2}},
	{boss = "The Frog Prince", pos = {x=32382,y=32131,z=7}},
	{boss = "Fleabringer", pos = {x=33089,y=31383,z=8}}, -- First Cave
	{boss = "Fleabringer", pos = {x=33111,y=31458,z=8}}, -- Second Cave
	{boss = "Fleabringer", pos = {x=33228,y=31415,z=7}}, -- Steppe
}

local function checkArea(pos, monster)
	local spectators = getSpectators(pos, 2, 2) -- 2 tile left, 2 right, 2 up, 2 down
	if spectators ~= NULL then
        for _, pid in pairs(spectators) do
            if isMonster(pid) and getCreatureName(pid):lower() == monster:lower() then
                return true
            end
        end
	end
	return false
end

function onThink(interval)

choosen = math.random(#raidTable)

if (checkArea(raidTable[choosen].pos, raidTable[choosen].boss) == false) then
	doSummonCreature(raidTable[choosen].boss, raidTable[choosen].pos)
end
	
return true

end
