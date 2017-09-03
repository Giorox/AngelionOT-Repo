function onUse(cid, item, frompos, item2, topos)

-- <beginning> Training Room script by Alreth.
-- Version 1.0, last edited 2006-06-02 17:39

-- Beginning of editable Variabels
    aidNor = 4211 -- Action id for door where training room is north of door
    aidSou = 4212 -- Action id for door where training room is south of door
    aidWes = 4213 -- Action id for door where training room is west of door
    aidEas = 4214 -- Action id for door where training room is east of door
-- End of editable Variabels
    
    emptyRoom = true
    charPos = getPlayerPosition(cid)
    
    if (item.actionid == aidNor) then
        if (charPos.y < frompos.y) then
            othersidePos = {x=frompos.x, y=frompos.y+1, z=frompos.z}
        else
            othersidePos = {x=frompos.x, y=frompos.y-1, z=frompos.z, stackpos=253}
            things = getThingfromPos(othersidePos)
            if (things.itemid == 1) then
                if (getPlayerLevel(things.uid) > 0) then
                    emptyRoom = false
                end
            end
        end
        
    elseif (item.actionid == aidSou) then
        if (charPos.y > frompos.y) then
            othersidePos = {x=frompos.x, y=frompos.y-1, z=frompos.z}
        else
            othersidePos = {x=frompos.x, y=frompos.y+1, z=frompos.z, stackpos=253}
            things = getThingfromPos(othersidePos)
            if (things.itemid == 1) then
                if (getPlayerLevel(things.uid) > 0) then
                    emptyRoom = false
                end
            end
        end
        
    elseif (item.actionid == aidEas) then
        if (charPos.x > frompos.x) then
            othersidePos = {x=frompos.x-1, y=frompos.y, z=frompos.z}
        else
            othersidePos = {x=frompos.x+1, y=frompos.y, z=frompos.z, stackpos=253}
            things = getThingfromPos(othersidePos)
            if (things.itemid == 1) then
                if (getPlayerLevel(things.uid) > 0) then
                    emptyRoom = false
                end
            end
        end
        
    elseif (item.actionid == aidWes) then
        if (charPos.x < frompos.x) then
            othersidePos = {x=frompos.x+1, y=frompos.y, z=frompos.z}
        else
            othersidePos = {x=frompos.x-1, y=frompos.y, z=frompos.z, stackpos=253}
            things = getThingfromPos(othersidePos)
            if (things.itemid == 1) then
                if (getPlayerLevel(things.uid) > 0) then
                    emptyRoom = false
                end
            end
        end
        
    end
    
    if (emptyRoom == true) then
        doTeleportThing(cid, othersidePos)
        doSendMagicEffect(charPos, 2)
        doSendMagicEffect(frompos, 12)
        doSendMagicEffect(othersidePos, 10)
        
    else
        doPlayerSendTextMessage(cid, 22, "Esta sala já está ocupada.")
    end
-- <end> Training Room script by Alreth.

    return 1
end