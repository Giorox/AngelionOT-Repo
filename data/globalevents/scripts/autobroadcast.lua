local messages = {
	
"Global Server espero y lo disfruten y recuerden invitar a sus amigos :D.",
	
"Global Server espero y lo disfruten y recuerden invitar a sus amigos :D."
}



local i = 0


function onThink(interval, lastExecution)

local message = messages[(i % #messages) + 1]
    
doBroadcastMessage("Information: " .. message .. "", MESSAGE_STATUS_CONSOLE_ORANGE)
    i = i + 1
    
return TRUE

end