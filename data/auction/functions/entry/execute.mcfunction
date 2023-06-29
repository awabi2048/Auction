## 出品エントリー本処理
# 乱数生成・プレイヤーのエントリー番号に代入
function auction:entry/number_selection
scoreboard players operation @s Auction.EntryNumber = $Random Auction
tag @s add Auction.Entried

tellraw @s [{"text":"[","color": "white"},{"text":"Auction","color": "#8a2be2"},{"text":"] ","color": "white"},{"text":"エントリーが完了しました。あなたのエントリー番号は","color": "white"},{"score":{"name": "@s","objective": "Auction.EntryNumber"},"color": "green"},{"text": "です。","color": "white"}]
playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1

# サイドバー設定
scoreboard objectives setdisplay sidebar Auction.EntryNumber
