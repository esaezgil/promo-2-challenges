def bugged_concatenate(array)
  array.inject(""){ |result, element| (result.to_s + element.to_s).upcase }
end

def build_1984_title
  bugged_concatenate([1, 9, 84, " ", "George Orwell"])
end

puts build_1984_title