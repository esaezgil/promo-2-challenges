require 'csv'
require_relative 'parser_nokogiri'
require 'nokogiri'
require 'open-uri'
require 'pry'

class Cookbook

  attr_accessor :file, :recipe

  def initialize(file)
    # TODO: Retrieve the data from your CSV file and store it in an instance variable
    @file = file
    @recipes = csv_to_array(@file)
    @parser
  end

  # TODO: Implement the methods to retrieve all recipes, create, or destroy recipes
  # TODO: Implement a save method that will write the data into the CSV
  # And don't forget to use this save method when you have to modify something in your recipes array.
  def all
    array = []
    @recipes.each {|cookbook_recipe| array << cookbook_recipe.join}
    p array
  end

  def create(name, rating, cook_time, preparation_time)
    @recipes << [Recipe.new(name, rating, cook_time, preparation_time)]
    save
  end

  def import(user_input)
    parse_to_array(@recipes, user_input)
    save
  end

  def destroy(index)
    @recipes.delete_at(index)
    save
  end

  def save
    CSV.open(@file, "wb") do |csv|
      @recipes.each {|recipe| csv << [recipe.name, recipe.rating, recipe.cook_time, recipe.preparation_time]}
    end
  end

  def csv_to_array(file_name)
    array = []
    CSV.foreach(file_name) do |row|
      array << Recipe.new(row[0], row[1].to_i, row[2].to_i, row[3].to_i)
    end
    array
  end

  def parse_to_array(array, input)

  doc = Nokogiri::HTML(open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{input}"))

  doc.search('.m_search_result').each do |element|
    array << Recipe.new(element.search('.m_search_titre_recette > a').inner_text, element.search('.etoile1').size/5, element.search('.m_search_result_part4').inner_text.strip.match(/Cuisson[\s+|:]+\d+[ min]/).to_s.match(/\d+/)[0].to_i , element.search('.m_search_result_part4').inner_text.strip.match(/Préparation[\s+|:]+\d+[ min]/).to_s.match(/\d+/)[0].to_i)
      end
    array
  end

end

pp =  Cookbook.new("recipes.csv")
pp.import("pomme")
puts pp
# puts pp.recipe
# p pp.all
# p pp.destroy("Apple pie")