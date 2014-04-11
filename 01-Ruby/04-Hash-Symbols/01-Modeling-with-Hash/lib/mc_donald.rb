  MENU = {
    "Cheese Burger" => 290,
    "Big Mac" => 300,
    "Mc Bacon" => 400,
    "Royal Cheese" => 130,
    "French fries" => 130,
    "Potatoes" => 130,
    "Coca" => 160,
    "Sprite" => 170,
    "Happy Meal" => 580
  }

def poor_calories_counter(burger, side, beverage)
  #TODO: return number of calories for this mcDonald order
  MENU[burger] + MENU[side] + MENU[beverage]
end

def calories_counter(*orders)
  #TODO: return number of calories for a less constrained order
  calories = 0

  orders.each do |order|
    calories += MENU[order]
  end

  calories
end

puts calories_counter("Big Mac", "French fries", "Happy Meal", "Coca")