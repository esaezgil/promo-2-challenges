class Post < ActiveRecord::Base

  def self.add_post(args)
    Post.create(name: args[:name], date: args[:date], source_url: args[:source_url], rating: args[:rating])
  end

  def delete
    self.destroy
  end
  def to_s
    puts "This post #{self.name} has been created on #{self.date}, its source_url is #{self.source_url} and has a #{self.rating} rating"
  end
end