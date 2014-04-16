require_relative "coach_answer"
#TODO: Implement the program that makes you discuss with your coach from the terminal.
puts "How are you today"
user_answer = gets.chomp

until coach_answer_enhanced(user_answer) == ""
  puts coach_answer_enhanced(user_answer)
  puts "Anything else?"
  user_answer = gets.chomp
end

