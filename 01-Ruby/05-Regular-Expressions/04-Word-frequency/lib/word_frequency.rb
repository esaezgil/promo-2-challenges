def most_common_words(file_name, stop_words_file_name, number_of_word)
  #TODO: return hash of occurences of number_of_word most frequent words
  hash_file = {}
  hash_stop = {}

  File.open(file_name, "r").each_line do |line|
    line.split(/\W+/).each do |word|
      hash_file[word.downcase] = hash_file[word.downcase] == nil ? hash_file[word.downcase] = 1 : hash_file[word.downcase] += 1
    end
  end

  File.open(stop_words_file_name, "r").each_line do |line|
    line.split.each do |word|
      hash_file.delete_if {|key, value| key.downcase == word}
    end
  end

  array_file = hash_file.sort_by {|key,value| value}.reverse!.slice(0..number_of_word-1)
  hash_file = {}

  array_file.each do |x,y|
    hash_file[x] = y
  end

hash_file

end
