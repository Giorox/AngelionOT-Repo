function onUse(cid, item, frompos, item2, topos)
if not isPlayer(getGlobalStorageValue(SNAKE.freeglobalstorage)) then
doTeleportThing(cid,SNAKE.controlpos)
SNAKE.timer(cid,1,nil,item.actionid == 0 and 500 or item.actionid)
doPlayerSendTextMessage(cid,25,'Segure a tecla control e use as setas para mover a cobra.')
SNAKE.generateFood()
else
doPlayerSendTextMessage(cid,25,'Espere alguem sair.')
end
end