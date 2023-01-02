# 受付中でなければエラー & 処理停止
execute if data storage auction: {Status:Idle} run tellraw @s [{"text":"[","color": "white"},{"text":"Auction","color": "dark_purple"},{"text":"] ","color": "white"},{"text":"エラー: 現在は入札受付時間外です。","color": "red","bold": false}]
execute if data storage auction: {Status:Idle} run function auction:empty

# 表示 (OOさんが00MPで入札しました！)
tellraw @a[tag=Auction.Participant] [{"text":"[","color": "white"},{"text":"Auction","color": "dark_purple"},{"text":"] ","color": "white"},{"selector":"@s"},{"text":"さんが"},{"score":{"name": "@s","objective": "AuctionBid"},"color": "gold","bold": true},{"text": "MP","color": "gold","bold": true},{"text": "で入札しました！","color": "white","bold": false}]

# ボスバー・タイマー設定
execute if score $Timer Auction matches 600.. run scoreboard players set $EndTimer Auction 600

bossbar set auction:bid_timer max 600

bossbar set auction:bid_timer color yellow

# タグ
tag @a remove Auction.TopBidder
tag @s add Auction.TopBidder
