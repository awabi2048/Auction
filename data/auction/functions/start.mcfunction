# 近くプレイヤーにタグ
execute at @e[tag=Auction.Core] run tag @a[distance=..16] add Auction.Participant

# カウントダウン開始
title @a[tag=Auction.Participant] times 5 60 50
scoreboard players set $Countdown Auction 4
function auction:countdown
