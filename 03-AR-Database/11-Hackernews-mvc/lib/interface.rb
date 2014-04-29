require_relative 'config/application'

#TODO: that's the entry point of your app.
class HackerNewsInterface
  def self.start_interface
    puts "Welcome on ElOuagòn News"
    action = available_actions

    while
      employee = nil
      wrong_password = true

      # Identification loop
      while employee.nil? or wrong_password
        print "Are you already a member ? y/n"
        user_choice = gets.chomp

        if user_choice == 'y'
          puts 'What is your enail'
          user_email = gets.chomp
          if User.find_by(email: user_email)
            user = User.find_by(email: user_email)
            logged_in = true
          else
            puts "We haven't found you in our database"
          end
        elsif user_choice == 'n'
          print "You can register by entering your name and your mail address"
          user_name = gets.chomp
          user_email = gets.chomp
          User.create(name: user_name, email: user_email)
          print "Thanks for registering"
        end
      end

      def self.available_actions
        @action = [
          MenuAction.new('Create Post') do |user|
            name = ask_and_get("name")
            source_url = ask_and_get("source url")
            rating = ask_and_get("rating")
            post = { user: user, name: name, source_url: source_url, date: Time.now, rating: rating }
            Post.create(post)
          end,

          MenuAction.new('Read Post') do |user|
            Post.all.where(user_id: user.id).each{|post| post.to_s}

          end,

          MenuAction.new('Delete Post') do |user|
            Post.all.where(user_id: user.id).destroy

          end,

        ]
      end

end
