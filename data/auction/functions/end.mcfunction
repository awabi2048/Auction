# 終了時処理
# 演出
execute at @a[tag=Auction.Participant] run playsound entity.player.levelup master @a[tag=Auction.Participant] ~ ~ ~ 1 1.5
execute at @a[tag=Auction.Participant] run playsound block.note_block.bell master @a[tag=Auction.Participant] ~ ~ ~ 1 1.4

# 告知
title @a[tag=Auction.Participant] times 10 60 10
tellraw @a[tag=Auction.Participant] [{"text":"[","color": "white"},{"text":"Auction","color": "dark_purple"},{"text":"] ","color": "white"},{"text":"入札の受付が終了しました！","color": "yellow","bold": false}]

execute if entity @a[tag=Auction.TopBidder] run title @a[tag=Auction.Participant] title [{"text": "落札者: ","color": "yellow","bold": true},{"selector":"@a[tag=Auction.TopBidder]","color": "white","bold": true},{"text": "(","color": "white","bold": true},{"score":{"name": "$BidTop","objective": "AuctionBid"},"color": "gold","bold": true},{"text": "MP","color": "gold","bold": true},{"text": ")","color": "white","bold": true}]
execute unless entity @a[tag=Auction.TopBidder] run title @a[tag=Auction.Participant] title [{"text":"[","color": "white"},{"text":"Auction","color": "dark_purple"},{"text":"] ","color": "white"},{"text": "落札者: ","color": "yellow","bold": true},{"text": "なし","color": "white","bold": true}]

execute if entity @a[tag=Auction.TopBidder] run tellraw @a[tag=Auction.Participant] [{"text": "落札者: ","color": "yellow","bold": true},{"selector":"@a[tag=Auction.TopBidder]","color": "white","bold": true},{"text": "(","color": "white","bold": true},{"score":{"name": "$BidTop","objective": "AuctionBid"},"color": "gold","bold": true},{"text": "MP","color": "gold","bold": true},{"text": ")","color": "white","bold": true}]
execute unless entity @a[tag=Auction.TopBidder] run tellraw @a[tag=Auction.Participant] [{"text":"[","color": "white"},{"text":"Auction","color": "dark_purple"},{"text":"] ","color": "white"},{"text": "落札者: ","color": "yellow","bold": true},{"text": "なし","color": "white","bold": true}]

title @a[tag=Auction.Participant] subtitle " "

# もろもろリセット
bossbar remove auction:bid_timer

scoreboard players set $EndTimer Auction -1
scoreboard players set $BidTimer Auction -1
scoreboard players set $Timer Auction -1

data modify storage auction: Status set value Idle

scoreboard players set @a AuctionBid -1
scoreboard players set $BidTop AuctionBid -1

tag @a remove Auction.Participant
tag @a remove Auction.TopBidder

# プラグイン関係
execute at @e[tag=Auction.BidPerm.Remove] run setblock ~ ~ ~ redstone_block
execute at @e[tag=Auction.BidPerm.Remove] run setblock ~ ~ ~ stone
