class Dessert
  attr_accessor :name, :calories

  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def healthy?
    @calories < 200
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert

  attr_reader :flavor

  def delicious?
    @flavor != "black licorice"
  end

  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

end