require_relative 'black_jack'

def play_game
  #TODO: make the user play from terminal in a while loop that will stop when the user will not be asking for  a new card
  score = 0
  bank = bank_score

  begin

    doweplay = asking_for_card?(score)

    if doweplay
      score += pick_card
      puts state_of_the_game(score, bank)
    end
  end until !doweplay || score >= 21 || score > bank

  puts build_message_for(game_outcome(bank, score))
end

def state_of_the_game(score, bank)
  # TODO: Returns custom message with player's score and bank's score
  "Your score is #{score}, bank is #{bank}!"
end

def asking_for_card?(score)
  # TODO: Ask for a card only if the score is less or equal to 21, then returns true or false according to the user's choice
  puts "Card ? (type 'Y' or 'yes' for a new card)" if score <= 21

  card = gets
  card.chomp! if card

  true if card.upcase == 'Y' || card.downcase == 'yes'
end

def build_message_for(outcome)
  #TODO: return specific message depending on the game outcome (= bank's score and user's score)
  if outcome[1] > 21
    "You are over 21... you loose."
  elsif outcome[1] == 21
    "Black Jack!"
  elsif outcome[0] > outcome[1]
    "Bank beats you! You loose."
  elsif outcome[0] < outcome[1]
    "You beat the bank! You win."
  else
    "This is a draw"
  end
end
