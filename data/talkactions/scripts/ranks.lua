function onSay(cid, words, param)
    if(param == "exp") or (param == "") then
doPlayerPopupFYI(cid, getHighscoreString(8))
    elseif(param == "magic") or (param == "ml") then
doPlayerPopupFYI(cid, getHighscoreString(7))
    elseif(param == "fishing") or (param == "fish") then
doPlayerPopupFYI(cid, getHighscoreString(6))
    elseif(param == "shielding") or (param == "shield") then
doPlayerPopupFYI(cid, getHighscoreString(5))
    elseif(param == "distance") or (param == "dist") then
doPlayerPopupFYI(cid, getHighscoreString(4))
    elseif(param == "sword") then
doPlayerPopupFYI(cid, getHighscoreString(2))
    elseif(param == "axe") then
doPlayerPopupFYI(cid, getHighscoreString(3))
    elseif(param == "club") then
doPlayerPopupFYI(cid, getHighscoreString(1))
    elseif(param == "fist") then
doPlayerPopupFYI(cid, getHighscoreString(0))
    end
    return TRUE
end