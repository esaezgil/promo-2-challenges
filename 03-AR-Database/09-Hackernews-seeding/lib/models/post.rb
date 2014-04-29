class Post < ActiveRecord::Base
  belongs_to :user

  def to_s
    puts "This post #{self.name} has been created on #{self.date}, its source_url is #{self.source_url} and has a #{self.rating} rating"
  end

end