require 'pry'

def roman_to_number(roman_number)

  if roman_number == nil
    0
  else
    romannumerics ={
        I: 1,
        V: 5,
        X: 10,
        L: 50,
        C: 100,
        D: 500,
        M:1000}

    number = romannumerics[roman_number.to_sym]
  end
end


def roman_to_integer(roman_string)
  #TODO: translate roman string to integer

  somme = 0

  #binding.pry

   if roman_string.length > 2

    roman_string.reverse.chars.each_slice(2).to_a.each do |x, y|

      if y == nil
        somme += roman_to_number(x)
      else
        somme += roman_to_number(x) >  roman_to_number(y) ? roman_to_number(x) - roman_to_number(y) : roman_to_number(x) + roman_to_number(y)
      end

    end

  else

    x = roman_string.reverse.chars.to_a[0] || nil
    y = roman_string.reverse.chars.to_a[1] || nil

      if y == nil
        somme += roman_to_number(x)
      else
        somme += roman_to_number(x) >  roman_to_number(y) ? roman_to_number(x) - roman_to_number(y) : roman_to_number(x) + roman_to_number(y)
      end


  end
  somme

end

# testing your program
puts roman_to_integer('IV') #== 4 # => true
puts roman_to_integer('XII') #== 12 # => true
puts roman_to_integer('XIX') #== 19 # => true
puts roman_to_integer('MMMMDCCCLXXXVIII')
