function onUse(cid, item, fromPosition, itemEx, toPosition)


if(itemEx.actionid == 33227) and (itemEx.itemid == 2249) then

local tp = doTransformItem(itemEx.uid, 1387)

doSendMagicEffect({x=32848, y=32232, z=9}, 5)

doSendMagicEffect({x=32849, y=32232, z=9}, 5)

doSendMagicEffect({x=32849, y=32233, z=9}, 5)

doSendMagicEffect({x=32850, y=32231, z=9}, 5)
doSendMagicEffect({x=32849, y=32231, z=9}, 5)

doSendMagicEffect({x=32848, y=32231, z=9}, 5)

doSendMagicEffect({x=32847, y=32231, z=9}, 5)

doSendMagicEffect({x=32848, y=32230, z=9}, 5)

doSendMagicEffect({x=32849, y=32230, z=9}, 5)

end

return TRUE

end