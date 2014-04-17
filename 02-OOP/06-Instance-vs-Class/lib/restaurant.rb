class Restaurant

  #TODO add relevant accessors if necessary
  attr_reader :city, :name, :average_rating
  def initialize(city, name)
    #TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @average_rating = 0
    @rates = []
  end

  #TODO: implement #filter_by_city and #rate methods
  def self.filter_by_city(arg=[], city)
    city_array = []
    city_array << arg.pop {|argument| argument.name if argument.city == city}
  end

  def rate(rate)
    @rates << rate
    @average_rating = @rates.reduce(:+)/@rates.length

  end

end
