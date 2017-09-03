function onSay(cid, words, param, channel)
    if getPlayerGroupId(cid) > 3 then
      for var = 1,3 do
        if var == 1 then
            doBroadcastMessage("Saving server...") --- this appears before server freeze...
        end
        if var == 2 then
            doSaveServer() --- freeezee....
        end
        if var == 3 then
            doBroadcastMessage("Done.") --- no more lag!
        end
    end
    end
    return true
end