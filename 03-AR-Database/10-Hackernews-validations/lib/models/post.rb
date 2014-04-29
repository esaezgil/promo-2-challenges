class Post < ActiveRecord::Base
  belongs_to :user

  validates :name, :date, :source_url, :rating, :user, presence: true
  validates :name, uniqueness: true
  validates :rating, numericality: {greater_than_or_equal_to: 0}

    def to_s
    puts "This post #{self.name} has been created on #{self.date}, its source_url is #{self.source_url} and has a #{self.rating} rating"
  end

end