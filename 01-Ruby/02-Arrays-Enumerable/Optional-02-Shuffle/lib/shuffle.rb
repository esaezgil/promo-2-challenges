def shuffle(array)
  #TODO: shuffle array manually
    subset = []
    a_temporary_array = array
    array_size = array.length

  for i in 0..array_size - 1
    jeffrey = rand(array.length)
    subset << array[jeffrey]
    array.delete_at(jeffrey)
  end

  subset
end
