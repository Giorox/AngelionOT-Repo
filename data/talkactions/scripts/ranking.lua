local ranks = {
['fist'] = {0},
['club'] = {1},
['sword'] = {2},
['axe'] = {3},
['distance'] = {4},
['shield'] = {5},
['fish'] = {6},
['magic'] = {7},
['level'] = {8},
}

function onSay(cid, words, param)
         local msg = string.lower(param)
         if ranks[msg] ~= nil then
            str = getHighscoreString((ranks[msg][1]))
         else
            str = getHighscoreString((8))
         end
         doShowTextDialog(cid,6500, str)
         return TRUE
end