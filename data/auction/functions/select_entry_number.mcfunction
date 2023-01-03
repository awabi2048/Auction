# エントリー番号抽選, 被ったら再抽選
function auction:random
execute as @a[tag=Auction.Entried] if score @s Auction.EntryNumber = $Random Auction run function auction:select_entry_number
