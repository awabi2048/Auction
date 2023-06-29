# 受付中でなければエラー & 処理停止
execute if data storage auction: {Status:Idle} run tellraw @s [{"text":"[","color": "white"},{"text":"Auction","color": "#8a2be2"},{"text":"] ","color": "white"},{"text":"エラー: 現在は入札受付時間外です。","color": "red","bold": false}]
execute if data storage auction: {Status:Idle} run function auction:stop_process

# 最高入札額・プレイヤー入札額更新
scoreboard players operation @s AuctionBid = @s AuctionBid.Temp
scoreboard players operation $BidTop AuctionBid = @s AuctionBid

scoreboard players operation $BidMin AuctionBid = @s AuctionBid
scoreboard players operation $BidMin AuctionBid += $BidMinUnit AuctionBid

# 表示用データの作成
execute store result storage auction: BidHighest.int int 1 run scoreboard players get @s AuctionBid
function auction:on_event/bid/number_conversion/_

# 表示 (XXさんが00MPで入札しました！)・効果音
tellraw @a[tag=Auction.Participant] [{"text":"[","color": "white"},{"text":"Auction","color": "#8a2be2"},{"text":"] ","color": "white"},{"selector":"@s","color": "white"},{"text":"さんが","color": "gray"},{"nbt":"BidHighest.string","storage": "auction:","interpret": true,"color": "gold","underlined": true},{"text": "MP","color": "gold","underlined": true},{"text": "で入札しました！","color": "gray","underlined": false}]
execute as @a[tag=Auction.Participant] at @s run playsound entity.player.levelup master @s ~ ~ ~ 1 1.8

# ボスバー・タイマー設定
scoreboard players set $BidTimer Auction 0
scoreboard players set $EndTimer Auction 600
bossbar set auction:bid_timer max 600

bossbar set auction:bid_timer color yellow

# タグ
tag @a remove Auction.TopBidder
tag @s add Auction.TopBidder
