#Encoding: utf-8

def louchebemize(sentence)
  #TODO: implement your louchebem translator
  subsentence =[]
  sentence.split(' ').each do |word|
    subsentence << ponctuation(word)
  end
  subsentence.join(" ")
end

def boucher(word)
  str2 = (/\A[aeiouy]/)
  str2maj = (/\A[AEIOUY]/)
  suffix = ["em", "é", "ji", "oc", "ic", "uche", "ès"]

  if word.length == 0 || word.length == 1
    word
  elsif word =~ str2
    'l' + word + suffix[rand(suffix.length - 1)]
  elsif word =~ str2maj
    'L' + word + suffix[rand(suffix.length - 1)]
  elsif word[0]=~ /\A(?=[^aeiou])(?=[a-z])/i && word[1]=~ /\A(?=[^aeiou])(?=[a-z])/i
    'l' + word.slice(2, word.length-1) + word[0..1] + suffix[rand(suffix.length - 1)]
  else
    'l' + word.slice(1, word.length-1) + word[0] + suffix[rand(suffix.length - 1)]
  end
end

def ponctuation(word)

  alphabet = ('a'...'z').to_a
  if !alphabet.include? word[-1]
    ponctuation(word[0..word.length-2]) + word[-1]
  else
    boucher(word)
  end
end
puts louchebemize('Le chat, va a la plage se baigner')
