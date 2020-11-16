# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# if User.count == 0
#   User.create(
#     name = "admin"
#     email = "admin@admin.com"
#     password: "password"
#     )

#   3.times do 
#     name = Faker::Name.unique.name
#     email = Faker::Internet.email
#     password = "password"
#     User.create(name:name, email:email, password:password)
#   end
# end

categories = ["Roll and Move", "Worker Placement", "Cooperative", "Deck Building", "Area Control", "Secret Identity", "Legacy Games", "Party Games", "Puzzle Games", "Combat Games"]

if Category.count == 0
  categories.each do |c|
    Category.create(name: c)
    puts "created #{c} category"
  end
end

if Post.count < 30
  20.times do |i|
    title = Faker::Commerce.product_name
    price = rand(1..1000)
    description = Faker::Quote.famous_last_words
    user_id = rand(1..3)
    category_id = rand(1..8)
    post = Post.create(title:title, price:price,description:description,user_id:user_id)
    
    post.categories << Category.find(rand(1..10))

    puts "created post #{i + 1}"
  end
end