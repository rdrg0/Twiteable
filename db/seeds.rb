# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: "admin", name: "admin", role: 1, email: "admin@test.com", password: "123456")
user = User.create(username: "rodrigo", name: "rodrigo", role: 0, email: "rodrigo@test.com", password: "123456")
user = User.create(username: "nat", name: "nat", role: 1, email: "nat@test.com", password: "123456")
user = User.create(username: "david", name: "david", role: 1, email: "david@test.com", password: "123456")


tweet= Tweet.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:2 )
tweet= Tweet.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:2 )
tweet= Tweet.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:2 )
tweet= Tweet.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:2 )
tweet= Tweet.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:3 )
tweet= Tweet.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:3 )
tweet= Tweet.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:4 )

reply = Tweet.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:2, replied_to_id:1 )
reply = Tweet.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:3, replied_to_id:1 )
reply = Tweet.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:4, replied_to_id:2 )
reply = Tweet.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:4, replied_to_id:3 )

like = Like.create(user_id:2, tweet_id:2)
like = Like.create(user_id:2, tweet_id:3)
like = Like.create(user_id:3, tweet_id:3)
like = Like.create(user_id:4, tweet_id:2)
