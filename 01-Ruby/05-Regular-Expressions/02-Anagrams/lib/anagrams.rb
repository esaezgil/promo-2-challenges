def word_slicer(word)
  word.downcase.chars.sort.join.slice(/\w+/)
end

def anagrams?(a_string, another_string)
  #TODO: implement the obvious method to test if two words are anagram
  if word_slicer(a_string).match(/(#{word_slicer(another_string)})/i) != nil
    true
  else
    false
  end
end

def anagrams_on_steroids?(a_string, another_string)
  #TODO: implement the improved method
    hash_test = {}

    test_array =[a_string, another_string]
    b=0

    test_array.each do |string|
      string.downcase.chars.each do |letter|
        hash_test[letter] == nil ? hash_test[letter] = 1 : hash_test[letter] += 1
      end
    end

    hash_test.each do |key, value|
        if key =~ /[a-z]/ &&  value % 2 != 0
           b += 1
        end
    end

    b < 1
end
