local Comentario = "Banido temporariamente."
function onSay(cid, words, param)
    if getPlayerAccess(cid) >= 4 then
        if #param > 0 then
            local data = string.explode(param, ",")
            if not getPlayerByName(data[1]) then
                doPlayerSendCancel(cid, "Coloque o nome do jogador.")
            elseif tonumber(data[2]) == nil then
                doPlayerSendCancel(cid, "Coloque a quantidade de dias.")
            else
                local name, dias = getPlayerByName(data[1]), tonumber(data[2])
                doAddBanishment(getPlayerAccountId(name), dias * 24 * 60 * 60, 19, 2, Comentario, getPlayerGUID(cid))
                doRemoveCreature(name)
            end
        else
            doPlayerSendCancel(cid, "Coloque os dados necessarios.")
        end
    end
    return TRUE
end  