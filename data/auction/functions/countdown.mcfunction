# 繰り返し
scoreboard players remove $Countdown Auction 1

# カウントダウン
execute if score $Countdown Auction matches 1.. run title @a[tag=Auction.Participant] title {"score":{"name": "$Countdown","objective": "Auction"},"color": "gold","bold": true}
execute if score $Countdown Auction matches 0 run title @a[tag=Auction.Participant] title {"text":"入札開始","color": "gold","bold": true}

execute if score $Countdown Auction matches 1.. at @e[tag=Auction.Core] run playsound block.note_block.bit master @a[tag=Auction.Participant] ~ ~ ~ 5 1
execute if score $Countdown Auction matches 0 at @e[tag=Auction.Core] run playsound block.note_block.pling master @a[tag=Auction.Participant] ~ ~ ~ 5 1

# 開始時
execute if score $Countdown Auction matches 0 run function auction:setup
execute if score $Countdown Auction matches 0 run scoreboard players set $Countdown Auction -1

execute if score $Countdown Auction matches 1.. run schedule function auction:countdown 1s
