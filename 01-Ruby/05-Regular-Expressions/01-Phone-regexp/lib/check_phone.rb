def french_phone_number?(phone_number)
  # TODO: true or false?
  if phone_number.to_s.match(/^(0|\+? ?33 ?)[1-9]{1}([ -_]?\d{2}){4}/) != nil
    true
  else
    false
  end
end
