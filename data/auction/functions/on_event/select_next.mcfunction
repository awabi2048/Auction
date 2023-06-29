# 次の出品者を選択
scoreboard players operation $Most Auction.EntryNumber > @a[tag=Auction.Entried] Auction.EntryNumber
execute as @a[tag=Auction.Entried] if score @s Auction.EntryNumber = $Most Auction.EntryNumber run tag @s add Auction.Seller

scoreboard players reset $Most Auction.EntryNumber
scoreboard players reset @a[tag=Auction.Seller] Auction.EntryNumber

tag @a[tag=Auction.Seller] remove Auction.Entried

# 告知
execute at @e[tag=Auction.Core] if entity @a[tag=Auction.Seller] if score $SellerCount Auction matches 0 run tellraw @a[distance=..16] [{"text":"[","color": "white"},{"text":"Auction","color": "#8a2be2"},{"text":"] ","color": "white"},{"text": "最初の出品者は","color": "green"},{"selector":"@a[tag=Auction.Seller]","color":"green"},{"text": "さんです。","color": "green"}]
execute at @e[tag=Auction.Core] if score $SellerCount Auction matches 1.. run tellraw @a[distance=..16] [{"text":"[","color": "white"},{"text":"Auction","color": "#8a2be2"},{"text":"] ","color": "white"},{"text": "次の出品者は","color": "green"},{"selector":"@a[tag=Auction.Seller]","color":"green"},{"text": "さんです。","color": "green"}]

execute at @e[tag=Auction.Core] unless entity @e[tag=Auction.Seller] run tellraw @a[distance=..16] [{"text":"[","color": "white"},{"text":"Auction","color": "#8a2be2"},{"text":"] ","color": "white"},{"text": "全てのプレイヤーの出品が完了しました。出品者はいません。","color": "green"}]

# 人数カウンター
scoreboard players add $SellerCount Auction 1

execute store result score $EntriedCount Auction if entity @a[tag=Auction.Entried]
execute if score $EntriedCount Auction matches 0 run scoreboard players set $SellerCount Auction 0

# 後処理
tag @a remove Auction.Seller
