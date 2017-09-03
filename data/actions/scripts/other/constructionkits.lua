local CONSTRUCTIONS = {
	[3901] = 1650, [3902] = 1658,  [11127] = 11123, [11199] = 11197, [11120] = 11121, [3903] = 1666, [3904] = 1670, [3905] = 3813, [3906] = 3817, [3907] = 2093, [3908] = 2603, [3909] = 1614, [3910] = 1615,
	[3911] = 1616, [3912] = 1619, [3913] = 3805, [3914] = 3807, [3915] = 1740, [3916] = 1774, [3917] = 2084, [3918] = 2095, [3919] = 3809, [3920] = 3832,
	[3921] = 1714, [3922] = 2107, [3923] = 2104, [3924] = 7670, [3925] = 1740, [3926] = 2080, [3927] = 2098, [3928] = 1676, [3929] = 2101, [3930] = 1739,
	[3931] = 2105, [3932] = 1724, [3933] = 1728, [3934] = 1732, [3935] = 1775, [3936] = 3812, [3937] = 2064, [3938] = 6371, [5086] = 1738, [5087] = 1741, [5088] = 1770,
	[6114] = 2106, [6115] = 2034, [6372] = 3811, [6373] = 1736, [7503] = 1750, [7700] = 5928, [7960] = 3821, [7961] = 3811, [7962] = 2582, [8692] = 8688, [8693] = 7486
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(fromPosition.x == CONTAINER_POSITION) then
		doPlayerSendCancel(cid, "Put the construction kit on the floor first.")
	elseif(not getTileInfo(fromPosition).house) then
		doPlayerSendCancel(cid,"You may construct this only inside a house.")
	elseif(CONSTRUCTIONS[item.itemid] ~= nil) then
		doTransformItem(item.uid, CONSTRUCTIONS[item.itemid])
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
	else
		return false
	end

	return true
end