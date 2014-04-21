require 'csv'



class Cookbook

  attr_accessor :file, :recipe

  def initialize(file)
    # TODO: Retrieve the data from your CSV file and store it in an instance variable
    @file = file
    @recipes = csv_to_array(@file)
  end

  # TODO: Implement the methods to retrieve all recipes, create, or destroy recipes
  # TODO: Implement a save method that will write the data into the CSV
  # And don't forget to use this save method when you have to modify something in your recipes array.
  def all
    array = []
    @recipes.each {|cookbook_recipe| array << cookbook_recipe.join}
    p array
  end

  def create(recipe)
    @recipes << [recipe]
    save
  end

  def destroy(index)
    @recipes.delete_at(index)
    save
  end

  def save
    CSV.open(@file, "wb") do |csv|
      @recipes.each {|recipe| csv << recipe}
    end
  end

  def csv_to_array(file_name)
    array = []
    CSV.foreach(file_name) do |row|
      array << row
    end
    array
  end
end

# pp =  Cookbook.new("lib/recipes.csv")
# pp.create("pingouin")
# puts pp.recipe
# p pp.all
# p pp.destroy("Apple pie")