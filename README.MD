
# mh-cashasitem
- use cash as item!


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
    ['shouldClose'] = false,
    ['combinable'] = nil,
    ['description'] = 'Cash'
},
```


# Edit qb-inventory/server/main.lua
- find the function `RemoveFromDrop` 
- and add below `if Drops[dropId].items[slot] and Drops[dropId].items[slot].name == itemName then`
```lua
if itemName == "cash" then
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddMoney("cash", amount, "take-dropped-cash")
end
```

# Add in qb-inventory/server/main.lua
- find `CreateNewDrop` 
- add below `Drops[dropId].items[toSlot] = {}`
```lua
if itemInfo["name"] == "cash" then
    Player.Functions.RemoveMoney("cash", itemAmount, "drop-cash")
end
```


## 🙈 Youtube & Discord
- [Youtube](https://www.youtube.com/c/MaDHouSe79)
- [Discord](https://discord.gg/cEMSeE9dgS)

# LICENSE
[GPL LICENSE](./LICENSE)<br />
&copy; [MaDHouSe79](https://www.youtube.com/@MaDHouSe79)
