## エントリーボタンクリック検知
# トリガー解除
advancement revoke @s only auction:on_entry

#> エントリー処理
# フラグ解除
data modify storage auction:temp CanEntry set value true

# エントリー期間内か確認
execute unless data storage auction: {AllowEntry:true} run tellraw @s [{"text":"[","color": "white"},{"text":"Auction","color": "#8a2be2"},{"text":"] ","color": "white"},{"text":"現在はエントリー受付期間外です。","color": "white"}]
execute unless data storage auction: {AllowEntry:true} run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

execute unless data storage auction: {AllowEntry:true} run data modify storage auction:temp CanEntry set value false

# もうしてたらエラー
execute if entity @s[tag=Auction.Entried] run tellraw @s [{"text":"[","color": "white"},{"text":"Auction","color": "#8a2be2"},{"text":"] ","color": "white"},{"text":"すでにエントリーしています。","color": "red"}]
execute if entity @s[tag=Auction.Entried] run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 0.5

execute if entity @s[tag=Auction.Entried] run data modify storage auction:temp CanEntry set value false

# エントリー不可のフラグでなければ処理実行
execute if data storage auction:temp {CanEntry:true} run function auction:entry/execute

# 乱数生成・プレイヤーのエントリー番号に代入
function auction:entry/number_selection
scoreboard players operation @s Auction.EntryNumber = $Random Auction
tag @s add Auction.Entried

tellraw @s [{"text":"[","color": "white"},{"text":"Auction","color": "#8a2be2"},{"text":"] ","color": "white"},{"text":"エントリーが完了しました。あなたのエントリー番号は","color": "white"},{"score":{"name": "@s","objective": "Auction.EntryNumber"},"color": "green"},{"text": "です。","color": "white"}]
playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1

# サイドバー設定
scoreboard objectives setdisplay sidebar Auction.EntryNumber

