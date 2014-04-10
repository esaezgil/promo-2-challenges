
nb_bottles = ARGV[0].to_i

def beersong(nb_at_start)
  #TODO: sing the song
  until nb_at_start == 0
      puts "#{nb_at_start} bottle#{'s' if nb_at_start != 1} of beer on the wall, #{nb_at_start} bottle#{'s' if nb_at_start != 1} of beer!"
    nb_at_start -= 1
  end
  puts "Take one down, pass it around, no more bottles of beer on the wall!"
end

beersong(nb_bottles)