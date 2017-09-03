function onStepIn(cid, item, pos)

	local trap = {x=32497, y=31888, z=7, stackpos=1}
		
	if item.actionid == 13002 then
				doCreatureAddHealth(cid, -200)
				doSendMagicEffect(trap,16)
				doSendAnimatedText(trap, '200', TEXTCOLOR_RED)
	end
	return TRUE
end