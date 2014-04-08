require_relative "coach_answer"
#TODO: Implement the program that makes you discuss with your coach from the terminal.
puts "How are you today"
user_answer = gets.chomp

while coach_answer(user_answer) != ""
  puts coach_answer(user_answer)
  puts "Any other question"
  user_answer = gets.chomp
end

