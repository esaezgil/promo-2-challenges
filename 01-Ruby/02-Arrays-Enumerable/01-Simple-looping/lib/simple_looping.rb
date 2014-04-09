def sum_with_while(a,b)
  #TODO: return the sum of the integers between a and b
  #CONSTRAINT: you should use a while..end structure
  sum = 0

  while a <= b
    sum += a
    a += 1
  end

  sum

end

def sum_with_for(a,b)
  #TODO: return the sum of the integers between a and b
  #CONSTRAINT: you should use a for..end structure
  sum  = 0
  for i in a..b
    sum += i
  end

  sum

end

def sum_recursive(a,b)
  #TODO (optional): return the sum of the integers between a and b
  #CONSTRAINT: you should use a recursive algorithm, i.e. the method should call itself
    if a > b
      raise ArgumentError
    end

    if a < b
      b + sum_recursive(a, b - 1)
    else
      a
    end
end

