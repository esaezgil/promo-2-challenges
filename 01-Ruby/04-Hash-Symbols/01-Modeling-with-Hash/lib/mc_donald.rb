  require 'pry'
  DISHES= {
    "Cheese Burger" => 290,
    "Big Mac" => 300,
    "Mc Bacon" => 400,
    "Royal Cheese" => 130,
    "French fries" => 130,
    "Potatoes" => 130,
    "Coca" => 160,
    "Sprite" => 170,
  }

  MEALS = {
    "Happy Meals" => ["Cheese Burger", "French fries", "Coca"],
    "Big Mac" => ["Big Mac", "French fries", "Coca"],
    "Royal Cheese" => ["Royal Cheese", "Potatoes", "Sprite"]

  }

def poor_calories_counter(burger, side, beverage)
  #TODO: return number of calories for this mcDonald order
  DISHES[burger] + DISHES[side] + DISHES[beverage]
end

def calories_counter(*orders)
  #TODO: return number of calories for a less constrained order
  calories = 0
  #binding.pry
  orders.each do |order|
    if MEALS[order]
      calories += MEALS[order].reduce(0) { |sum, meal| sum + DISHES[meal] }
    else
      calories += DISHES[order]
    end
  end
end

puts calories_counter("Big Mac", "French fries", "Happy Meals", "Coca")