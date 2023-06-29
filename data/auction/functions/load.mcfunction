# スコアボード定義
scoreboard objectives add Auction dummy
scoreboard objectives add Auction.Temp dummy

scoreboard objectives add Auction.EntryNumber dummy {"text":"エントリー番号","color": "white","bold": true}


scoreboard objectives add AuctionBid dummy
scoreboard objectives add AuctionBid.Temp dummy

# 定数定義
scoreboard players set #10 Auction 10
scoreboard players set #20 Auction 20
scoreboard players set #60 Auction 60

scoreboard players set #99 Auction 99

scoreboard players set #127 Auction 127

# 各種変数定義
execute unless score $BidMinUnit AuctionBid = $BidMinUnit AuctionBid run scoreboard players set $BidMinUnit AuctionBid 100

execute unless score $BidMax AuctionBid = $BidMax AuctionBid run scoreboard players set $BidMax AuctionBid 10000000
execute unless score $BidStart AuctionBid = $BidStart AuctionBid run scoreboard players set $BidStart AuctionBid 1000
execute unless score $BidMin AuctionBid = $BidMin AuctionBid run scoreboard players set $BidMin AuctionBid 0
