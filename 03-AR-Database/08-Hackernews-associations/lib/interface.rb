require_relative 'config/application'
require_relative 'models/post'
require_relative 'models/user'


def ask_and_get(param)
  puts "What is the #{param} of your piece of news?"
  gets.chomp
end

while true

  logged_in = false

  until logged_in
    puts "Please login with your <id>"
    #TODO: instantiate a user with his <id>
    user_id = gets.chomp.to_i
    if User.find_by(id: user_id)
      user = User.find_by(id: user_id)
      logged_in = true
     else
      puts "We haven't found you in our database"
      user_name = ask_and_get("user name")
      user_email =  ask_and_get("email")
      user = User.create(name: user_name, email: user_email)
      logged_in = true
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
    post = { name: name, source_url: source_url, date: Time.now, rating: rating }
    #TODO: use ActiveRecord to add a new post for the user logged in!
    Post.add_post(user.id, post)
  when 2
    #TODO: use ActiveRecord to get all posts of the current user
    Post.all.where(user_id: user.id).to_s

  when 3
    #TODO: use ActiveRecord to delete all posts of current user
    Post.all.where(user_id: user.id).destroy
  when 4
    break
	end

end