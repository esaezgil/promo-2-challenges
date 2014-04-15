require 'open-uri'
require 'json'

def choose_word
  mot =[]
  File.open('./liste_francais.txt', "r").each_line do |line|
    mot << line.to_s
  end
  mot[rand(mot.length-1)]

end

def generate_grid(grid_size)
  #TODO: generate random grid of letters
  array = []
  for i in 0..grid_size-1
   array.push((('a'..'z').to_a+['a','e','i','o','u']*2).to_a[rand(25)])
  end
  array
end

def grid_inclusion(grid, word)
  b = 0
  grid.each {|item| item.downcase!}
  word.downcase!
  word.chars.each do |letter|
    if grid.include? letter
      grid.delete_at(grid.index(letter).to_i)
    else
      b += 1
      break
    end
  end
    b == 0
end

def run_game(attempt, grid, start_time, end_time)
  #TODO: runs the game and return detailed hash of result
  word = attempt

  if JSON.parse(URI.parse("http://api.wordreference.com/0.8/80143/json/enfr/#{word}").read)["Error"] == nil

    html_file = JSON.parse(URI.parse("http://api.wordreference.com/0.8/80143/json/enfr/#{word}").read)
    mot = html_file["term0"]["PrincipalTranslations"]["0"]["OriginalTerm"]["term"] == word ? html_file["term0"]["PrincipalTranslations"]["0"]["FirstTranslation"]["term"] : "Perdu"

  end

  back_hash = {}

  if mot && grid_inclusion(grid, word)
    back_hash = {
      time: (end_time - start_time).to_i,
      translation: mot,
      score: (word.length * 5)/((end_time - start_time).to_i),
      message: "well done"
    }
  elsif mot && !grid_inclusion(grid, word)
  back_hash = {
      time: (end_time - start_time).to_i,
      translation: mot,
      score: 0,
      message: "not in the grid"
    }
  else
      back_hash = {
      time: (end_time - start_time).to_i,
      translation: nil,
      score: 0,
      message: "not an english word"
    }
  end
  back_hash

end