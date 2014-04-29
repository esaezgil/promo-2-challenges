require_relative 'config/application'
require './models/post'
require './models/user'

def ask_and_get(param)
  puts "What is the #{param} of your piece of news?"
  gets.chomp
end

while true

  logged_in = false

  until logged_in
    puts "Please login with your email"
    #TODO: instantiate a user with his <id>
    user_email = gets.chomp
    if User.find_by(email: user_email)
      user = User.find_by(email: user_email)
      logged_in = true
     else
      puts "We haven't found you in our database"
    end

  end

  puts "Hey #{user.name}, what do you want to do today? Enter <task_id>"
  puts "1. Create a post"
  puts "2. Read your posts"
  puts "3. Delete all posts"
  puts "4. Exit"

  choice =  gets.chomp.to_i

  case choice
  when 1
    name = ask_and_get("name")
    source_url = ask_and_get("source url")
    rating = ask_and_get("rating")
    post = { user: user, name: name, source_url: source_url, date: Time.now, rating: rating }
    #TODO: use ActiveRecord to add a new post for the user logged in!
    Post.create(post)
  when 2
    #TODO: use ActiveRecord to get all posts of the current user
    #Post.all.each {|post| post.to_s if post.user_id == user.id}
    Post.all.where(user_id: user.id).each{|post| post.to_s}
  when 3
    #TODO: use ActiveRecord to delete all posts of current user
    #Post.all.each {|post| post.destroy if post.user_id == user.id}
    Post.all.where(user_id: user.id).destroy
  when 4
    break
  end

end