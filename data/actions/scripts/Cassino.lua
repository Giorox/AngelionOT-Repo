 
--[[
	Advanced Slot Machine
		by Cybermaster	 
]]--
 
--REQUIRED MONEY(gp) TO PLAY SLOT MACHINE
local money = 1000
 
--MILISECONDS TO CHANGE FRUITS
local time = 200
 
--ITERATOR TIME TO STOP CHANGING FRUIT IF PLAYER DOESN'T (30 is like 7 seconds)
local limit = 30
 
--FRUITS THAT WILL RANDOMLY APPEAR AND SWITCH
local fruits = {2674,2675,2676,2679,2680,2682,2683,5097,8841}
 
--PRIZES TABLES
local win = {
-- [{FRUIT.1,FRUIT.2,FRUIT.3} = {PRIZE,#PRIZE}]
	--MIXED COMBOS
	[{2679,2683,2679}] = {2160,2},  -- cherry-pumpkin-cherry
	[{8841,2682,8841}] = {2160,1},  -- lemon-melon-lemon
	--TRIPLE COMBOS
	[{2680,2680,2680}] = {2152,80}, -- triple strawberry
	[{5097,5097,5097}] = {2152,60}, -- triple mango
	[{2683,2683,2683}] = {2152,80}, -- triple pumpkin
	[{2682,2682,2682}] = {2152,50}, -- triple melon
	[{2676,2676,2676}] = {2152,40}, -- triple banana
	[{8841,8841,8841}] = {2152,25}, -- triple lemon
	[{2679,2679,2679}] = {2152,20}, -- triple cherry
	[{2675,2675,2675}] = {2152,30}, -- triple orange
	[{2674,2674,2674}] = {2152,10}, -- triple apple
	--ANY COMBOS
	[{ANY,2683,2683}] = {2152,5}, -- double pumpkin right
	[{2683,2683,ANY}] = {2152,5}, -- double pumpkin left
	[{2683,ANY,2683}] = {2152,10}, -- pumpkin sides combo
	[{ANY,2679,2679}] = {2152,4}, -- double cherry right
	[{2679,2679,ANY}] = {2152,4}, -- double cherry left
	[{2679,ANY,2679}] = {2152,8}, -- cherry sides combo
	[{ANY,8841,8841}] = {2152,5}, -- double lemon right
	[{8841,8841,ANY}] = {2152,5}, -- double lemon left
	[{8841,ANY,8841}] = {2152,5}, -- lemon sides combo
}
 
--MESSAGES THAT RANDOMLY APPEAR WHEN PLAYER WINS
local messages = {'Bingo!','Lucky!','Jackpot!','Win!'}
 
--FRUITS ROWS
local p = { --[LEVER.UNIQUEID]
	[6297] = {},[6298] = {},[6299] = {},[6300] = {}, --[6301] = {},
} --JUST PUT THE INITIAL ROW POS FROM LEFT, SECOND & THIRD WILL BE AUTOM. GENERATED
for i = 1,3 do --p, UNIQUEID.LEVER, {POS FROM TILE OF LEFT}
	table.insert(p[6297],i,{x=992+(i-1),y=1015,z=7,stackpos=1})
	table.insert(p[6298],i,{x=996+(i-1),y=1015,z=7,stackpos=1})
	table.insert(p[6299],i,{x=1000+(i-1),y=1015,z=7,stackpos=1})
	table.insert(p[6300],i,{x=1004+(i-1),y=1015,z=7,stackpos=1})
	-- table.insert(p[6301],i,{x=19+(i-1),y=1015,z=7,stackpos=1})
end
 
function verifyRow(cid, array, pos)
	local result, prize = false, ''
	for a, b in pairs(win) do
		if getTileItemById(pos[1],a[1]).uid > 1 or a[1] == ANY then
			if getTileItemById(pos[2],a[2]).uid > 1 or a[2] == ANY then
				if getTileItemById(pos[3],a[3]).uid > 1 or a[3] == ANY then
					doPlayerAddItem(cid, b[1], b[2] or 1, true)
					doSendAnimatedText(getThingPos(cid), messages[math.random(#messages)], math.random(255))
					result, prize, amount = true, b[1], b[2]
				end
			end
		end	
	end
	if prize ~= '' then 
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, 'Congratulations!! You won '..amount..' '..getItemPluralNameById(prize)..'!')
	end
	for i = 1,3 do 
		doSendMagicEffect(pos[i], result and CONST_ME_GIFT_WRAPS or CONST_ME_EXPLOSIONHIT)
		doRemoveItem(getTileThingByPos(pos[i]).uid)
	end
	return not result and doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, 'You have lost in the Slot Machine :( Try again')
end
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
 
	local function doFruit(pos,cid,id,limit)
		if not isPlayer(cid) then
			return doItemEraseAttribute(item.uid, 'aid'), getTileThingByPos(pos).uid > 0 and doRemoveItem(getTileThingByPos(pos).uid)
		end
		if getTileThingByPos(pos).itemid < 1 then
			doSendMagicEffect(pos, CONST_ME_POFF)
			doCreateItem(fruits[math.random(#fruits)], 1, pos)
		else
			doTransformItem(getTileThingByPos(pos).uid,fruits[math.random(#fruits)],1)
		end
		if limit <= 0 then
			doSendMagicEffect(pos,math.random(28,30))		
			doTransformItem(getTileThingByPos(pos).uid,fruits[math.random(#fruits)],1)
			doItemSetAttribute(getTileThingByPos(fromPosition)  .uid, 'aid', getTileThingByPos(fromPosition).actionid+1)
			doTransformItem(getTileThingByPos(fromPosition).uid, getTileThingByPos(fromPosition).itemid == 9826 and 9825 or 9826)
		elseif getTileThingByPos(fromPosition).actionid > id then
			doSendMagicEffect(pos,math.random(28,30))
			doTransformItem(getTileThingByPos(pos).uid,fruits[math.random(#fruits)],1)
		else
			addEvent(doFruit,time,pos,cid,id,limit-1)
		end
	end
 
	if item.actionid == 0 then
		if not doPlayerRemoveMoney(cid, money) then	
			return doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, 'You need '..money..' gps to play Slot Machine.')
		end
		doItemSetAttribute(item.uid, 'aid', 1)
		doCreatureSetNoMove(cid, true)
		doTransformItem(item.uid, item.itemid == 9826 and 9825 or 9826)
		doSendAnimatedText(getThingPos(cid), '-$'..money,COLOR_RED)
		for i = 1,3 do doFruit(p[item.uid][i],cid,i,i*limit) end
	elseif isInArray({1,2,3},item.actionid) then
		doItemSetAttribute(item.uid, 'aid', item.actionid+1)
		doTransformItem(item.uid, item.itemid == 9826 and 9825 or 9826)
	elseif item.actionid == 4 then
		doCreatureSetNoMove(cid, false)
		doItemEraseAttribute(item.uid, 'aid')
		doTransformItem(item.uid, item.itemid == 9826 and 9825 or 9826)
		verifyRow(cid, win, p[item.uid])	
	end		
	return true
end