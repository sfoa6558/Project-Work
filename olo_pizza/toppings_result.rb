require_relative 'pizza_topping'
require_relative 'topping_ranking'

toppings = PizzaTopping.new('',1,[],[])
topping_ranking = ToppingRanking.new
toppings.parsed_data
toppings.gather_toppings
topping_ranking.rankings(topping_ranking.top(topping_ranking.reverse(toppings.toppings_count), 20))

##Output
=begin
Ranking 1: {:toppings=>[["pepperoni"]], :count=>4616}
Ranking 2: {:toppings=>[["mozzarella cheese"]], :count=>1014}
Ranking 3: {:toppings=>[["four cheese"]], :count=>956}
Ranking 4: {:toppings=>[["bacon"]], :count=>732}
Ranking 5: {:toppings=>[["beef"]], :count=>623}
Ranking 6: {:toppings=>[["sausage"]], :count=>402}
Ranking 7: {:toppings=>[["italian sausage"]], :count=>361}
Ranking 8: {:toppings=>[["chicken"]], :count=>229}
Ranking 9: {:toppings=>[["ham"]], :count=>165}
Ranking 10: {:toppings=>[["mushrooms"]], :count=>159}
Ranking 11: {:toppings=>[["black olives"]], :count=>117}
Ranking 12: {:toppings=>[["pepperoni", "four cheese"]], :count=>103}
Ranking 13: {:toppings=>[["alredo sauce"]], :count=>101}
Ranking 14: {:toppings=>[["four cheese", "pepperoni"]], :count=>100}
Ranking 15: {:toppings=>[["mozzarella cheese", "pepperoni"]], :count=>96}
Ranking 16: {:toppings=>[["cheddar cheese"]], :count=>95}
Ranking 17: {:toppings=>[["pineapple"]], :count=>79}
Ranking 18: {:toppings=>[["pepperoni", "beef"]], :count=>67}
Ranking 19: {:toppings=>[["pepperoni", "bacon"]], :count=>63}
Ranking 20: {:toppings=>[["pepperoni", "mozzarella cheese"]], :count=>59}
=end