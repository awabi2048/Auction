## 
# 
# -1桁目を保管するためのスペース追加
data modify storage auction:temp NumberConversion.out prepend value "null"

# 処理される桁
scoreboard players operation $NumberConversion.DigitSingle Auction.Temp = $NumberConversion.Current Auction.Temp
scoreboard players operation $NumberConversion.DigitSingle Auction.Temp %= #10 Auction

# 分割後の値
scoreboard players operation $NumberConversion.Current Auction.Temp /= #10 Auction

execute store result storage auction:temp NumberConversion.Digit int 1 run scoreboard players get $NumberConversion.DigitSingle Auction.Temp
data modify storage auction:temp NumberConversion.out[0] set string storage auction:temp NumberConversion.Digit

# カンマ追加のタイミングはかるため処理桁数記録
scoreboard players add $Digit Auction.Temp 1

# 3桁おきにカンマの追加, 桁数記録リセット
execute if score $Digit Auction.Temp matches 3 if score $NumberConversion.Current Auction.Temp matches 1.. run data modify storage auction:temp NumberConversion.out prepend value ","
execute if score $Digit Auction.Temp matches 3 run scoreboard players set $Digit Auction.Temp 0

# 処理できる桁があれば再帰
execute if score $NumberConversion.Current Auction.Temp matches 1.. run function auction:on_event/bid/number_conversion/loop
