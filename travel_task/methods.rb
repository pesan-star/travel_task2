def disp_plans(plans)
  puts "旅行プランを選択して下さい。"
  plans.each.with_index(1) do |plan, i|
    puts "#{i}.#{plan[:place]}旅行(#{plan[:price]}円)"
  end
end

def choose_plan(plans)
  while true
    print "プランの番号を選択 >"
    select_plan_num = gets.to_i
    break if (1..3).include?(select_plan_num)
    puts "1〜3を入力して下さい。"
  end
  plans[select_plan_num - 1]
end

def decide_num_of_people(chosen_plan)
  puts " #{chosen_plan[:place]}旅行ですね。"
  puts "何名で予約されますか？"
  while true
    print "人数を入力 >"
    num_of_people = gets.to_i
    break if num_of_people >= 1
    puts "1以上を入力して下さい。"
  end

  num_of_people
end

def calculate_charges(chosen_plan, num_of_people)
  puts "#{num_of_people}名ですね。"
  total_price = num_of_people * chosen_plan[:price]
  if num_of_people >= 5
    puts "5名以上ですので10%割引となります"
    total_price *= 0.9
  end
  puts "合計金額は#{total_price.floor}円になります"
end