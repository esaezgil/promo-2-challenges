class SuperHero
  attr_reader :first_name, :last_name, :superhero_name
  attr_accessor :super_powers

  def initialize(first_name, last_name, superhero_name, super_powers)
    @first_name = first_name
    @last_name = last_name
    @superhero_name = superhero_name
    @super_powers = super_powers
  end

  def changing_in_a_photo_booth
    if @superhero_name == "Superman"
      "I've just changed in a photo booth and nobody took the pics"
    else
      "I always change at home"
    end
  end

  def banging_lois_lane
    puts "Am I dressed as Superman? Answer by yes or no"

    answer = gets.chomp
    response = answer.strip.downcase == "yes" ? "Shit, I got to get rid of this stupid costume" : "You gonna get Supernailed"
  end
end

# superman = SuperHero.new("Clark", "Kent", "Superman", ["Flying", "Super Force", "Super Fast", "Red briefs"])
# p superman
# p superman.changing_in_a_photo_booth
# p superman.banging_lois_lane