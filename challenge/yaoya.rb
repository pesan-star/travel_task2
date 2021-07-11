products = [
  {name: "トマト", price: 100},
  {name: "きゅうり", price: 200},
  {name: "玉ねぎ", price: 300},
  {name: "なす", price: 400}
]


FIRST_PRODUCT_NUM = 1
LAST_PRODUCT_NUM = (FIRST_PRODUCT_NUM + products.size) - 1
DISCOUNT_STANDARD_VALUE = 5
DISCOUNT_RATE = 0.1
AFTER_DISCOUNT_RATE = 1 - DISCOUNT_RATE


puts "いらっしゃいませ！商品を選んで下さい。"
puts""
products.each.with_index(FIRST_PRODUCT_NUM) do |product,i|
  puts "#{i}.#{product[:name]}(#{product[:price]}円)"
end

puts ""
while true
  print "商品の番号を選択 > "
  select_product_num = gets.to_i
break if (FIRST_PRODUCT_NUM..LAST_PRODUCT_NUM).include?(select_product_num)
  puts "#{FIRST_PRODUCT_NUM}~#{LAST_PRODUCT_NUM}の番号を入力して下さい。"
end

chosen_product = products[select_product_num - FIRST_PRODUCT_NUM]

puts""
puts "#{chosen_product[:name]}ですね。何個買いますか？"
while true
  print "個数を入力 > "
  quantity_of_product = gets.to_i
break if quantity_of_product >= 1
  puts "1個以上選んでください。"
end

total_price = chosen_product[:price] * quantity_of_product
puts""
if quantity_of_product >= DISCOUNT_STANDARD_VALUE
  puts "#{DISCOUNT_STANDARD_VALUE}個以上なので#{(DISCOUNT_RATE*100).floor}％割引となります！"
  total_price *= AFTER_DISCOUNT_RATE
  #puts "合計金額は#{discounted_total_price}円です。"
#else
  #puts "合計金額は#{total_price}円です。"
end
puts "合計金額は#{total_price.floor}円です。"
puts "お買い上げありがとうございました！"