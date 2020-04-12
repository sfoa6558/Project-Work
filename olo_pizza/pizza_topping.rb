require_relative 'topping_parser'

class PizzaTopping
  attr_accessor :prev_val
  attr_accessor :counter
  attr_accessor :toppings_count
  attr_accessor :parsed_pizza_data
  def initialize(val, count, all_toppings_count, data)
    @prev_val = val
    @counter = count
    @toppings_count = all_toppings_count
    @parsed_pizza_data = data
  end

  def compare(hash)
    if @prev_val != hash.values && @prev_val != ''
      @toppings_count << { toppings: @prev_val, count: @counter}
      @counter = 1
    end
    @counter += 1 if @prev_val == hash.values
    @prev_val = hash.values
  end

  def call_compare(hash)
    hash.each do |hs|
      compare(hs)
    end
  end

  def parsed_data
    parser = ToppingParser.new('https://www.olo.com/pizzas.json')
    @parsed_pizza_data = parser.get_data(parser.get_response(parser.parse(parser.uri)))
  end

  def gather_toppings
    sorted_toppings = @parsed_pizza_data.sort_by { |hsh|hsh.values.first }
    call_compare(sorted_toppings)
  end
end




