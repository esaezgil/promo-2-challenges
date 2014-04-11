def array_to_hash(array)
  #TODO: implement the method :)
  hash = {}

  array.each_with_index do |elts, index|
    key = block_given? ? (yield(index)) : (index)
    hash[key] = elts
  end
  hash
end