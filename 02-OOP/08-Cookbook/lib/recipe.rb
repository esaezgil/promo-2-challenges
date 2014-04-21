class Recipe

  attr_reader :name, :cook_time, :preparation_time, :rating

  def initialize(name, rating, cook_time, preparation_time)
    @name = name
    @rating = rating
    @cook_time = cook_time
    @preparation_time = preparation_time
  end

  def recipe_to_array(recipe)
    array = 0
    recipe.each_value {|value| array << value}
    array
  end
end