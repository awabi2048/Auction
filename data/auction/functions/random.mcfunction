# 乱数生成
scoreboard players set $Random Auction 0

execute if predicate auction:half run scoreboard players add $Random Auction 1
execute if predicate auction:half run scoreboard players add $Random Auction 2
execute if predicate auction:half run scoreboard players add $Random Auction 4
execute if predicate auction:half run scoreboard players add $Random Auction 8
execute if predicate auction:half run scoreboard players add $Random Auction 16
execute if predicate auction:half run scoreboard players add $Random Auction 32
execute if predicate auction:half run scoreboard players add $Random Auction 64

scoreboard players operation $Random Auction *= #99 Auction
scoreboard players operation $Random Auction /= #127 Auction
