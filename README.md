# Scrap Mechanic XMS (Cross Mod Scripting)

## Can I use this in my mod?
Yes! You do not have to ask for my permission. It's free of charge.

## How it works?
All Userdata objects in lua have a bug where their items are shared:
```lua
Userdata_A.foo = "foo"
Userdata_B.foo = "bar"
print(Userdata_A.foo)
```
This will print `"bar"` because of the bug and because the item names are the same.

This works for every Userdata object and the items are only accessable for
the mod the script is running. However, a <Widget> Userdata is special. For
some reason the items of the <Widget> Userdata are shared between all mods.

This script uses that bug to allow other mods to use shared variables.