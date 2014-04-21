require 'nokogiri'
require 'open-uri'
require_relative 'recipe.rb'
require 'pry'

# doc = Nokogiri::HTML(open('http://www.marmiton.org/recettes/recherche.aspx?aqt=fraise'))

# doc.search('.m_search_result').each do |element|
#     puts "#{element.search('.m_search_titre_recette > a').inner_text}"
#     puts "Rating : #{element.search('.etoile1').size} / 5}"
#     puts "Preparation time: #{element.search('.m_search_result_part4').inner_text.strip.match(/\w+?[èéêëēėęàáâäæãå]?\w+?[\s+|:]+\d+[ min]/).to_s.match(/\d+/)} minutes"
#     puts "Cooking time: #{element.search('.m_search_result_part4').inner_text.strip.match(/Cuisson[\s+|:]+\d+[ min]/).to_s.match(/\d+/)} minutes"

#     end

def parse_to_array(array,input)
  p "http://www.marmiton.org/recettes/recherche.aspx?aqt=#{input}"
  doc = Nokogiri::HTML(open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{input}"))

  doc.search('.m_search_result').each do |element|
     puts "#{element.search('.m_search_titre_recette > a').inner_text}"
     puts "Rating : #{element.search('.etoile1').size} / 5}"
     puts "Preparation time: #{element.search('.m_search_result_part4').inner_text.strip.match(/\w+?[èéêëēėęàáâäæãå]?\w+?[\s+|:]+\d+[ min]/).to_s.match(/\d+/)} minutes"
     puts "Cooking time: #{element.search('.m_search_result_part4').inner_text.strip.match(/Cuisson[\s+|:]+\d+[ min]/).to_s.match(/\d+/)} minutes"
   end

  doc.search('.m_search_result').each do |element|
    array << Recipe.new(name: element.search('.m_search_titre_recette > a').inner_text,
      rating: element.search('.etoile1').size/5,
      cooking_time: element.search('.m_search_result_part4').inner_text.strip.match(/Cuisson[\s+|:]+\d+[ min]/) ,
      preparation_time: element.search('.m_search_result_part4').inner_text.strip.match(/Préparation[\s+|:]+\d+[ min]/))
    end
  array
end

doc = Nokogiri::HTML(open("http://www.marmiton.org/recettes/recherche.aspx?aqt=pomme"))

doc.search('.m_search_result').each do |element|
p Recipe.new(element.search('.m_search_titre_recette > a').inner_text, element.search('.etoile1').size/5, element.search('.m_search_result_part4').inner_text.strip.match(/Cuisson[\s+|:]+\d+[ min]/).to_s.match(/\d+/), element.search('.m_search_result_part4').inner_text.strip.match(/Préparation[\s+|:]+\d+[ min]/).to_s.match(/\d+/))
end
