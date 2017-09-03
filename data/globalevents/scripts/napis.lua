 local pozycje = {

{pos = {x=1029, y=1040, z=7}, tekst = "Arena"},
{pos = {x=32366, y=32235, z=7}, tekst = "Trainers"},
{pos = {x=32369, y=32241, z=7}, tekst = "Welcome!!"},










 



 

 
 }

		function onThink(interval, lastExecution)
			local kolor = TEXTCOLOR_TEAL   -- Jakim kolorem jest dany napis
			for i=1, #pozycje do
				doSendMagicEffect(pozycje[i].pos,28)
				doSendAnimatedText(pozycje[i].pos,pozycje[i].tekst,kolor)
			end
			return true
			end