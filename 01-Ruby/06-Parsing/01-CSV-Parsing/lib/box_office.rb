#Encoding: utf-8
require 'csv'
require 'date'

def csv_to_array(file_name)

  movies = []

  CSV.foreach(file_name, :headers => false) do |row|
    film = {
      name: row[0],
      year: row[1].to_i,
      earnings: row[2].to_i
  }
  movies << film
  end
  movies
end

def movie_curation(array, number, max_year)

  array.delete_if {|item| item[:year].to_i >= max_year.to_i}.sort_by {|x| x[:earnings] }.reverse!.slice(0..number-1)

end

def most_successfull(number, max_year, file_name)
  #TODO: return the number most successfull movies max_year
  movies = csv_to_array(file_name)
  movie_curation(movies, number, max_year)
end

#p most_successfull(10, 1980, 'lib/movies.csv')