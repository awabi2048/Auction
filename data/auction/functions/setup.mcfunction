# タイマー用ボスバー・スコア設定
bossbar add auction:bid_timer ""
bossbar set auction:bid_timer max 3600

bossbar set auction:bid_timer players @a[tag=Auction.Participant]

scoreboard players set $BidTimer Auction 3600

title @a[tag=Auction.Participant] times 0 60 0

# 告知
tellraw @a[tag=Auction.Participant] [{"text":"[","color": "white"},{"text":"Auction","color": "dark_purple"},{"text":"] ","color": "white"},{"text":"入札の受付を開始しました！ /acで入札画面を開きます。","color": "yellow","bold": false}]

# トリガー
data modify storage auction: Status set value Active

# 演出
execute at @a[tag=Auction.Participant] run playsound minecraft:block.anvil.land master @s ~ ~ ~ 1 2

# プラグイン関係
execute at @e[tag=Auction.BidPerm.Add] run setblock ~ ~ ~ redstone_block
execute at @e[tag=Auction.BidPerm.Add] run setblock ~ ~ ~ stone
