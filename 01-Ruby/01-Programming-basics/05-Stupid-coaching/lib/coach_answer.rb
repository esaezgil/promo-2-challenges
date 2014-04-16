def coach_answer(your_message)
  # TODO: return coach answer to your_message
  if your_message[-1] == "?"
    "Silly question, get dressed and go to work !"

  elsif your_message == "I am going to work right now SIR !"
      ""
  else
    "I don't care son, get dressed and go to work !"
  end

end


def coach_answer_enhanced(your_message)
  # TODO: return coach answer to your_message, with additional custom rules of yours !
  if your_message[-1] == "?"
    "Silly question, get dressed and go to work !"

  elsif your_message == "I am going to work right now SIR !"
    ""

  elsif your_message.upcase == your_message
    "I can feel your motivation son !"

  elsif your_message.include? "girl"
    "Is she hot?"
  else
    "I don't care son, get dressed and go to work !"

  end

end

