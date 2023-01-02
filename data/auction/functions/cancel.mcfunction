# 緊急時キャンセル
# 告知
tellraw @a[tag=Auction.Participant] [{"text":"[","color": "white"},{"text":"Auction","color": "dark_purple"},{"text":"] ","color": "white"},{"text":"オークションをキャンセルしました。","color": "red","bold": false}]

# もろもろリセット
bossbar remove auction:bid_timer

scoreboard players set $EndTimer Auction -1
scoreboard players set $BidTimer Auction -1
scoreboard players set $Timer Auction -1

data modify storage auction: Status set value Idle

scoreboard players reset @a[tag=Auction.Participant] AuctionBid

scoreboard players set $BidTop AuctionBid -1
scoreboard players set $BidMin AuctionBid -1

tag @a remove Auction.Participant
tag @a remove Auction.TopBidder
