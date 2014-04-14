# Encoding: utf-8

def mail_joke(email)
  # TODO: Return a joke suited to the email provided
  surname = email.match(/^\w+([-_]?\w+)+/).to_s
  name = email.match(/([.]\w+)/).to_s.match(/(\w+)/).to_s
  domain = email.match(/([@]\w+[.]\w+)/).to_s.match(/(\w+[.]\w+)/).to_s

  raise ArgumentError if email.match(/^(\w+[-_.]?)+[@](\w+[-_]?)[.]\w+/) == nil
  case domain
  when 'lewagon.org'
    "Well done #{surname}, you're skilled and capable"
  when 'gmail.com'
    "#{surname}, you're an average but modern person"
  when 'live.com'
    "#{surname} #{name}, aren't you born before 1973?"
  else
    "Sorry #{surname}, we don't know how to judge '#{domain}'"
  end
end