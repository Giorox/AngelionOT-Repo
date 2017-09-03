function onAddItem(moveitem, tileitem, position, cid)
gol1 = {
{x=328,y=240,z=7},
{x=329,y=244,z=7}
}
gol2 = {
{x=352,y=240,z=7},
{x=353,y=244,z=7}
}
poscentro2 = {x = 335,y = 242,z = 7}
poscentro1 = {x = 346,y = 242,z = 7}
if inArea(position,gol1[1],gol1[2]) then
   doBroadcastMessage("Gol do time 1!")
   setGlobalStorageValue(20000,getGlobalStorageValue(20000) + 1)
   doRemoveItem(moveitem.uid)
   doCreateItem(moveitem.itemid,poscentro1)
elseif inArea(position,gol2[1], gol2[2]) then
   doBroadcastMessage("Gol do time 2!")
   setGlobalStorageValue(20001,getGlobalStorageValue(20001) + 1)
   doRemoveItem(moveitem.uid)
   doCreateItem(moveitem.itemid,poscentro2)
end
return true
end

function inArea(p,pos1,pos2)
         if p.x >= pos1.x and p.x <= pos2.x then
            if p.y >= pos1.y and p.y <= pos2.y then
               if p.z == pos1.z then
                 return true
               end
            end
         end
return false
end