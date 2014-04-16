# require 'pry'
#def group_anagrams(words)
  #TODO: group anagrams
 # subwords = words
  #subwords.sort! {|x,y| x.chars.sort.join <=> y.chars.sort.join}

#subwords.group_by {|x| x}.values.chars.sort.join
 # subwords
#end
def group_anagrams(words)
  hashwords = {}

  words.each {|word| hashwords[word] = word.downcase.chars.sort.join}
  subwords = words.sort.group_by {|word| hashwords[word]}.values

  subwords
end
# input:
p group_anagrams( ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'] )

# =>  [["cars", "racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]]
