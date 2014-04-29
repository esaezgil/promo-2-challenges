require_relative "../config/application"
require_relative "../models/post"
require_relative "../models/user"

# Seed you database with post data from hacker news
# And fake users using Faker gem

puts "Seeding database..."

#TODO: Your code goes here
# 1. create fake users
# 2. Scrape news from https://news.ycombinator.com/ and associate posts to your existing users
until User.all.count == 100
  p user = {name: Faker::Name.name , email: Faker::Internet.email}
  User.create(user)
end

doc = Nokogiri::HTML(open('https://news.ycombinator.com/'))

doc.search('.title > a').each do |element|
    name = element.inner_text
    source_url = element['href']

    sibling = element.parent.parent.next_sibling

    if sibling
      rating = ("#{sibling.search('.subtext > span').inner_text.strip.match(/\d+/).to_s}").to_i
      user = User.find_by(id: rand(100))
      post = {name: name, source_url: source_url, date: Date.new, rating: rating, user: user}
      Post.create(post)
    end
end
