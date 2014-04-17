class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)
  attr_reader :height, :dead, :fruits, :age, :found_dead

  def initialize
    @age = 0
    @height = 0
    @fruits = 0
    @dead = false
    @found_dead = 0
  end

  def one_year_passes!
    unless @dead
      @age += 1
      @height +=1 if @age <=10
      @fruits = 0
      @found_dead = rand(age..100) if age > 50
      @dead = true if age >= 100 || @found_dead == 100

      if @age > 10 && @age <= 15
        @fruits += 200
      elsif @age > 5 && @age <=15
        @fruits += 100
      end
    end
  end

  def pick_a_fruit!
    @fruits -= 1 if @fruits
  end

  def dead?
    @dead
  end

end
# orange_tree = OrangeTree.new

# 100.times  do
#   orange_tree.one_year_passes!
#   p orange_tree
# end
