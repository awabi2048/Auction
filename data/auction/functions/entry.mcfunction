# 出品エントリー
# そもそもエントリー期間内?
execute unless data storage auction: {AllowEntry:true} run tellraw @s [{"text":"[","color": "white"},{"text":"Auction","color": "dark_purple"},{"text":"] ","color": "white"},{"text":"現在はエントリー受付期間外です。","color": "white"}]
execute unless data storage auction: {AllowEntry:true} run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

execute unless data storage auction: {AllowEntry:true} run function auction:stop_process

# エントリーしてないよ
execute if predicate auction:is_sneaking unless entity @s[tag=Auction.Entried] run tellraw @s [{"text":"[","color": "white"},{"text":"Auction","color": "dark_purple"},{"text":"] ","color": "white"},{"text":"まだエントリーしていません。","color": "red"}]
execute if predicate auction:is_sneaking unless entity @s[tag=Auction.Entried] run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

execute if predicate auction:is_sneaking unless entity @s[tag=Auction.Entried] run function auction:stop_process

# スニーク中だったらエントリー辞退
execute if predicate auction:is_sneaking run tellraw @s [{"text":"[","color": "white"},{"text":"Auction","color": "dark_purple"},{"text":"] ","color": "white"},{"text":"エントリーを辞退しました。","color": "white"}]
execute if predicate auction:is_sneaking run playsound ui.button.click master @s ~ ~ ~ 1 0.75

execute if predicate auction:is_sneaking run tag @s remove Auction.Entried
execute if predicate auction:is_sneaking run scoreboard players reset @s Auction.EntryNumber

execute if predicate auction:is_sneaking run function auction:stop_process

# もうしてたらエラー & 処理中断
execute if entity @s[tag=Auction.Entried] run tellraw @s [{"text":"[","color": "white"},{"text":"Auction","color": "dark_purple"},{"text":"] ","color": "white"},{"text":"すでにエントリーしています。","color": "red"}]
execute if entity @s[tag=Auction.Entried] run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

execute if entity @s[tag=Auction.Entried] run function auction:stop_process

# 乱数生成・プレイヤーのエントリー番号に代入
function auction:select_entry_number
scoreboard players operation @s Auction.EntryNumber = $Random Auction
tag @s add Auction.Entried

tellraw @s [{"text":"[","color": "white"},{"text":"Auction","color": "dark_purple"},{"text":"] ","color": "white"},{"text":"エントリーが完了しました。あなたのエントリー番号は","color": "white"},{"score":{"name": "@s","objective": "Auction.EntryNumber"},"color": "green"},{"text": "です。","color": "white"}]
playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1

# サイドバー設定
scoreboard objectives setdisplay sidebar Auction.EntryNumber
