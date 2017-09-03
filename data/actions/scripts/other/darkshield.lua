function onUse(cid, item, frompos, item2, topos)
    tile1 = {x=32225, y=32276, z=8, stackpos=0} --change tilepos
    gettile1 = getThingfromPos(tile1)

    if item.itemid == 1945 then
        doRemoveItem(gettile1.uid,1)
        doCreateItem(9021,1,tile1) --change tile ID
        doTransformItem(item.uid,item.itemid+1)
    elseif item.itemid == 1946 then
        doRemoveItem(gettile1.uid,1) 
        doCreateItem(8279,1,tile1) --change itemID --change tile ID
        doTransformItem(item.uid,item.itemid-1)        
    end

    return 1
end