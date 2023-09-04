# mh-cashasitem
- use cash as item!

# Add in `[qb]/qb-inventory/server/main.lua`
```lua
local function UpdateCashItem(source, amount, mode)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if mode == 'add' then
		Player.Functions.AddMoney("cash", amount, "take-cash") 
	end
	if mode == "remove" and Player.Functions.GetMoney('cash') >= amount then 
		Player.Functions.RemoveMoney("cash", amount, "remove-cash") 
	end
end
```

# Find the fintion `CreateNewDrop` around line 1065
```lua 
if itemInfo["name"] == "cash" then
	UpdateCashItem(source, itemAmount, 'remove')
end
```

# Find the function `RemoveFromDrop` 
- Add after `Drops[dropId].items[slot].amount = Drops[dropId].items[slot].amount - amount`
```lua
if Drops[dropId].items[slot].name == "cash" then
    UpdateCashItem(source, Drops[dropId].items[slot].amount, 'add')
end
```

# Add in trigger `inventory:server:SetInventoryData` around line 2209 
- add this below after `AddItem(src, fromItemData.name, fromAmount, toSlot, fromItemData.info)`
```lua
if itemInfo["name"] == "cash" then
	UpdateCashItem(src, fromAmount, "add")
end
```

# do the same at line 2228 
- below `AddToDrop(toInventory, toSlot, itemInfo["name"], fromAmount, fromItemData.info)`
```lua
if itemInfo["name"] == "cash" then
	UpdateCashItem(src, fromAmount, "add")
end
```

# Add in `[qb]/qb-core/shared/items.lua` 
- and don't forgot the add the cash.png in to your inventory image folder.
```lua
['cash'] = {
    ['name'] = 'cash', 
    ['label'] = 'Cash', 
    ['weight'] = 0, 
    ['type'] = 'item', 
    ['image'] = 'cash.png', 
    ['unique'] = false,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'Cash'
},
```


## 🙈 Youtube & Discord
- [Youtube](https://www.youtube.com/c/MaDHouSe79)
- [Discord](https://discord.gg/cEMSeE9dgS)

# LICENSE
[GPL LICENSE](./LICENSE)<br />
&copy; [MaDHouSe79](https://www.youtube.com/@MaDHouSe79)
