# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


User.destroy_all
Tweet.destroy_all
Like.destroy_all

puts "Seeding users"
user = User.new(username: "admin", name: "admin", role: 1, email: "admin@test.com", password: "123456")
user.avatar.attach(io: File.open('app/assets/images/Imageanonymus.png'), filename: 'Imageanonymus.png')
user.save
user = User.create(username: "rodrigo", name: "rodrigo", role: 0, email: "rodrigo@test.com", password: "123456")
user.avatar.attach(io: File.open('app/assets/images/Imagedieguito.png'), filename: 'Imagedieguito.png')
user.save
user = User.create(username: "nat", name: "nat", role: 1, email: "nat@test.com", password: "123456")
user.avatar.attach(io: File.open('app/assets/images/Imagedog.png'), filename: 'Imagedog.png')
user.save
user = User.create(username: "david", name: "david", role: 1, email: "david@test.com", password: "123456")
user.avatar.attach(io: File.open('app/assets/images/Imagethanos.png'), filename: 'Imagethanos.png')
user.save

users = User.all

puts "Seeding tweets"
10.times do
  Tweet.create( body:Faker::TvShows::SiliconValley.quote, user_id:users.sample.id )
end

tweets = Tweet.all

puts "Seeding replies"
20.times do
  Tweet.create(body:Faker::TvShows::SiliconValley.quote, user_id:users.sample.id, replied_to_id:tweets.sample.id )
end

tweets = Tweet.all

puts "Seeding likes"

20.times do
  like = Like.create(user_id: users.sample.id, tweet_id:tweets.sample.id)
end
  