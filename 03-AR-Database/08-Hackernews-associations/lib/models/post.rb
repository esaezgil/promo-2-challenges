class Post < ActiveRecord::Base
  #TODO: add association to the user model
  belongs_to :users, foreign_key: 'user_id'

  def self.add_post(user_id, args)
    Post.create(user_id: user_id, name: args[:name], date: args[:date], source_url: args[:source_url], rating: args[:rating])
  end

  def delete
    self.destroy
  end

  def to_s
    puts "This post #{self.name} has been created on #{self.date}, its source_url is #{self.source_url} and has a #{self.rating} rating"
  end
end