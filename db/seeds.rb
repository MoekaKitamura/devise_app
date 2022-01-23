# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  email: "admin@g.com",
  password: "111111",
  admin: true,
)

5.times do |n|
  Blog.create!(
    title:"ブログ#{n}",
    content:"わたしはドーナツを#{n}つ食べている🍩"
  )
end