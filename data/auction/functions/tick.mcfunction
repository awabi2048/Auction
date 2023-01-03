# タイマー計算・表示
    # 20秒タイマー
    execute if data storage auction: {Status:Active} if score $EndTimer Auction matches 1.. run scoreboard players remove $EndTimer Auction 1
    execute if data storage auction: {Status:Active} if score $EndTimer Auction matches 0.. run scoreboard players operation $Timer Auction = $EndTimer Auction

    # 入札終了までのタイマー
    execute if data storage auction: {Status:Active} if score $BidTimer Auction matches 1.. run scoreboard players remove $BidTimer Auction 1
    execute if data storage auction: {Status:Active} if score $BidTimer Auction matches 0.. unless score $EndTimer Auction matches 1.. run scoreboard players operation $Timer Auction = $BidTimer Auction
    
    execute store result storage auction:temp BidTimer.Sum int 0.05 run scoreboard players get $Timer Auction
    execute store result bossbar auction:bid_timer value run scoreboard players get $Timer Auction

    execute store result score $Timer_Second Auction run data get storage auction:temp BidTimer.Sum
    execute store result score $Timer_Minute Auction run data get storage auction:temp BidTimer.Sum

    scoreboard players operation $Timer_Second Auction %= #60 Auction
    scoreboard players operation $Timer_Minute Auction /= #60 Auction

    # ボスバー表示
    execute unless score $Timer_Minute Auction matches 0 run bossbar set auction:bid_timer name [{"text": "入札残り時間: ","color": "gold","bold": true},{"score":{"name": "$Timer_Minute","objective": "Auction"},"color": "white"},{"text": "分","color": "white"},{"score":{"name": "$Timer_Second","objective": "Auction"},"color": "white"},{"text": "秒","color": "white"}]
    execute if score $Timer_Minute Auction matches 0 run bossbar set auction:bid_timer name [{"text": "入札残り時間: ","color": "gold","bold": true},{"score":{"name": "$Timer_Second","objective": "Auction"},"color": "white"},{"text": "秒","color": "white"}]

    # 終了周辺処理
    execute if score $Timer Auction matches 80 at @a[tag=Auction.Participant] run playsound block.note_block.pling master @a[tag=Auction.Participant] ~ ~ ~ 2 1 
    execute if score $Timer Auction matches 60 at @a[tag=Auction.Participant] run playsound block.note_block.pling master @a[tag=Auction.Participant] ~ ~ ~ 2 1 
    execute if score $Timer Auction matches 40 at @a[tag=Auction.Participant] run playsound block.note_block.pling master @a[tag=Auction.Participant] ~ ~ ~ 2 1.5

    execute if score $Timer Auction matches 0 run function auction:on_event/bid/end

# 最高入札者表示
execute if data storage auction: {Status:Active} if entity @a[tag=Auction.TopBidder] run title @a[tag=Auction.Participant] title "" 
execute if data storage auction: {Status:Active} if entity @a[tag=Auction.TopBidder] run title @a[tag=Auction.Participant] subtitle [{"text": "入札者: ","color": "white","bold": true},{"selector":"@a[tag=Auction.TopBidder]","color": "green"},{"text": ", ","color": "white","bold": true},{"text": "暫定最高入札額: ","bold": true},{"score":{"name": "$BidTop","objective": "AuctionBid"},"color": "gold","bold": true},{"text": "MP","color": "gold","bold": true}]
