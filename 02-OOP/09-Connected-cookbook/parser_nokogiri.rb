require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.marmiton.org/recettes/recherche.aspx?aqt=fraise'))

doc.search('.m_search_result').each do |element|
    puts "#{element.search('.m_search_titre_recette > a').inner_text}"
    puts "Rating : #{element.search('.etoile1').size} / 5}"
    puts "Preparation time: #{element.search('.m_search_result_part4').inner_text.strip.match(/\w+?[èéêëēėęàáâäæãå]?\w+?[\s+|:]+\d+[ min]/).to_s.match(/\d+/)} minutes"
    puts "Cooking time: #{element.search('.m_search_result_part4').inner_text.strip.match(/Cuisson[\s+|:]+\d+[ min]/).to_s.match(/\d+/)} minutes"

    end
def parse_to_array(array, input)
  doc = Nokogiri::HTML(open('http://www.marmiton.org/recettes/recherche.aspx?aqt=#{input}'))

  doc.search('.m_search_result').each do |element|




    array << "#{element.search('.m_search_titre_recette > a').inner_text}"
    end
  array
end

p Hash.new {
  name: "toto",
  cooking_time: 30,
  preparation_time: 20,
  ingredients: ['aa','bb','cc']}