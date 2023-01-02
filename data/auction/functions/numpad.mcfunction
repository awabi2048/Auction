# メニュー操作の計算
# リセット
execute unless score @s AuctionBid.Temp matches 0.. run scoreboard players set @s AuctionBid.Temp 0

# 桁繰り上がり
scoreboard players operation @s AuctionBid.Temp *= #10 Auction
scoreboard players operation @s AuctionBid.Temp += $ClickedNumber AuctionBid.Temp 
scoreboard players reset $ClickedNumber AuctionBid.Temp

# エラー時通知, 変更をリセット
execute if score @s AuctionBid.Temp > $BidMax AuctionBid run tellraw @s {"text":"入力上限を超えています！","color":"green"}
execute if score @s AuctionBid.Temp > $BidMax AuctionBid at @s run playsound minecraft:block.note_block.didgeridoo master @s ~ ~ ~ 1 1
execute if score @s AuctionBid.Temp > $BidMax AuctionBid run scoreboard players operation @s AuctionBid.Temp /= #10 Auction

# 成功時
execute if score @s AuctionBid.Temp <= $BidMax AuctionBid at @s run playsound block.note_block.bit master @s ~ ~ ~ 1 2
