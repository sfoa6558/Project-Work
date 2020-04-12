# Rank Toppings
class ToppingRanking
  def reverse(count_toppings)
    count_toppings.sort_by {|topping| topping[:count]}.reverse
  end

  def top(popular_toppings,num_top_combinations)
    popular_toppings.take(num_top_combinations)
  end

  def rankings(toppings)
    toppings.each_with_index{|topping,i| puts "Ranking #{i+1}: #{topping}"}
  end
end

