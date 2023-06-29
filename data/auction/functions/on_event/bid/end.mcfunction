# 終了時処理
# 演出
execute at @a[tag=Auction.Participant] run playsound entity.player.levelup master @a[tag=Auction.Participant] ~ ~ ~ 1 1.5
execute at @a[tag=Auction.Participant] run playsound block.note_block.bell master @a[tag=Auction.Participant] ~ ~ ~ 1 1.4

# 告知
title @a[tag=Auction.Participant] times 10 60 10
tellraw @a[tag=Auction.Participant] [{"text":"[","color": "white"},{"text":"Auction","color": "#8a2be2"},{"text":"] ","color": "white"},{"text":"入札の受付が終了しました！","color": "yellow","bold": false}]

execute if entity @a[tag=Auction.TopBidder] run title @a[tag=Auction.Participant] title [{"text": "落札者: ","color": "yellow","bold": true},{"selector":"@a[tag=Auction.TopBidder]","color": "white","bold": false}]
execute if entity @a[tag=Auction.TopBidder] run title @a[tag=Auction.Participant] subtitle [{"text": "(","color": "white"},{"nbt":"BidHighest.string","storage": "auction:","interpret": true,"color": "gold","underlined": true},{"text": "MP","color": "gold"},{"text": ")","color": "white"}]

execute if entity @a[tag=Auction.TopBidder] run tellraw @a[tag=Auction.Participant] [{"text": "落札者: ","color": "yellow"},{"selector":"@a[tag=Auction.TopBidder]","color": "white","bold": true}," ",{"text": "(","color": "white"},{"nbt":"BidHighest.string","storage": "auction:","interpret": true,"color": "gold","underlined": true},{"text": "MP","color": "gold","underlined": true},{"text": ")","color": "white"}]
execute unless entity @a[tag=Auction.TopBidder] run tellraw @a[tag=Auction.Participant] [{"text":"[","color": "white"},{"text":"Auction","color": "#8a2be2"},{"text":"] ","color": "white"},{"text": "落札者: ","color": "yellow","bold": true},{"text": "なし","color": "white"}]

# もろもろリセット
data modify storage auction: Status set value Idle

# 各種タイマー
bossbar remove auction:bid_timer

scoreboard players set $EndTimer Auction -1
scoreboard players set $BidTimer Auction -1
scoreboard players set $Timer Auction -1

# 入札金額
scoreboard players set @a[tag=Auction.Participant] AuctionBid 0

scoreboard players set $BidTop AuctionBid 0
scoreboard players set $BidMin AuctionBid 0

# タグ除去
tag @a remove Auction.Participant
tag @a remove Auction.TopBidder
