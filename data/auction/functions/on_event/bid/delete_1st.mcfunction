# 1位の入札をキャンセル、2位を繰り上げ
# リセット
scoreboard players reset @a[tag=Auction.TopBidder] AuctionBid
tag @a remove Auction.TopBidder

# 再度ソート, タグ付与
execute as @e[tag=Auction.Participant] store result score @s AuctionBid.Temp run scoreboard players get @s AuctionBid
scoreboard players operation $BidTop AuctionBid > @a[tag=Auction.Participant] AuctionBid.Temp

execute as @a[tag=Auction.Participant] if score @s AuctionBid = $BidTop AuctionBid run tag @s add Auction.TopBidder

# 告知
tellraw @a[tag=Auction.Participant] [{"text":"[","color": "white"},{"text":"Auction","color": "#8a2be2"},{"text":"] ","color": "white"},{"text":"1位の入札をキャンセルし、2位の入札を繰り上げ1位にしました。","color": "red","bold": false}]
tellraw @a[tag=Auction.Participant] [{"selector":"@a[tag=Auction.TopBidder]"},{"text":"さんが"},{"score":{"name": "$BidTop","objective": "AuctionBid"},"color": "gold","bold": true},{"text": "MP","color": "gold","bold": true},{"text": "で1位入札者になりました！"}]
