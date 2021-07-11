plans = [
  { plan: "沖縄旅行", price: 10000 },
  { plan: "北海道旅行", price: 20000 },
  { plan: "九州旅行", price: 15000 },
]

FIRST_PLAN_NUM = 1
LAST_PLAN_NUM = (FIRST_PLAN_NUM + plans.size) - 1
DISCOUNT_STANDARD_VALUE = 5
DISCOUNT_RATE = 0.1
AFTER_DISCOUNT_RATE = 1 - DISCOUNT_RATE

puts "旅行プランを選択して下さい。"
puts ""
plans.each.with_index(FIRST_PLAN_NUM) do |plan, i|
  puts "#{i}.#{plan[:plan]}(#{plan[:price]}円)"
end

puts ""
while true
  print "プランの番号を選択 >"
  select_plan_num = gets.to_i
  break if (FIRST_PLAN_NUM..LAST_PLAN_NUM).include?(select_plan_num)
  puts "#{FIRST_PLAN_NUM}〜#{LAST_PLAN_NUM}の番号を入力して下さい。"
end
chosen_plan = plans[select_plan_num - FIRST_PLAN_NUM]

puts "#{chosen_plan[:plan]}ですね。"
puts "何名で予約されますか？"

while true
  print "人数を入力 >"
  num_of_people = gets.to_i
  break if num_of_people >= 1
  puts "1以上を入力して下さい。"
end
puts "#{num_of_people}名ですね。"

total_price = chosen_plan[:price] * num_of_people
if num_of_people >= DISCOUNT_STANDARD_VALUE
  puts "#{DISCOUNT_STANDARD_VALUE}名以上ですので#{(DISCOUNT_RATE * 100).floor}%割引となります"
  total_price *= AFTER_DISCOUNT_RATE
end

puts "合計金額は#{total_price.floor}円になります"
