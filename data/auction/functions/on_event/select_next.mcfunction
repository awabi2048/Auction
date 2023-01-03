# 次の出品者を選択
scoreboard players operation $Most Auction.EntryNumber > @a[tag=Auction.Entried] Auction.EntryNumber
execute as @a[tag=Auction.Entried] if score @s Auction.EntryNumber = $Most Auction.EntryNumber run tag @s add Auction.Seller

scoreboard players reset $Most Auction.EntryNumber

tag @a[tag=Auction.Seller] remove Auction.Entried

# 人数カウンター
scoreboard players add $SellerCount Auction 1

execute store result score $EntriedCount Auction if entity @a[tag=Auction.Entried]
execute if score $EntriedCount Auction matches 0 run scoreboard players reset $SellerCount Auction

# 告知
execute at @e[tag=Auction.Core] if score $SellerCount Auction matches 1 run tellraw @a[distance=..16] [{"text":"[","color": "white"},{"text":"Auction","color": "dark_purple"},{"text":"] ","color": "white"},{"text": "最初の出品者は","color": "white"},{"selector":"@a[tag=Auction.Seller]"},{"text": "さんです。","color": "white"}]
execute at @e[tag=Auction.Core] if score $SellerCount Auction matches 2.. run tellraw @a[distance=..16] [{"text":"[","color": "white"},{"text":"Auction","color": "dark_purple"},{"text":"] ","color": "white"},{"text": "次の出品者は","color": "white"},{"selector":"@a[tag=Auction.Seller]"},{"text": "さんです。","color": "white"}]

execute at @e[tag=Auction.Core] if score $SellerCount Auction = $SellerCount Auction run tellraw @a[distance=..16] [{"text":"[","color": "white"},{"text":"Auction","color": "dark_purple"},{"text":"] ","color": "white"},{"text": "全てのプレイヤーが出品を完了しました。出品者はいません。","color": "white"}]

