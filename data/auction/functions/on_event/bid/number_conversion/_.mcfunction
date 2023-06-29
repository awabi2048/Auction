## intを表示用にカンマを付けたStringListに変換
#> 前準備
# 入力を設定
execute store result score $NumberConversion.Current Auction.Temp run data get storage auction: BidHighest.int

# 出力をリセット
data modify storage auction:temp NumberConversion.out set value []
scoreboard players set $Digit Auction.Temp 0

#> 実処理の実行
function auction:on_event/bid/number_conversion/loop

#> 処理結果の移動
data modify storage auction: BidHighest.string set from storage auction:temp NumberConversion.out
