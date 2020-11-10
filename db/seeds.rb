# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 20.times do |i|
#   Post.create(
#     title: Faker::Book.title
#     price: rand(0..1000)
#     description: Faker::Quote.famous_last_words
#     user_id: rand(1..100)
#   )
#   puts "created post #{i + 1}"
# end

categories = ["Roll and Move", "Worker Placement", "Cooperative", "Deck Building", "Area Control", "Secret Identity", "Legacy Games", "Party Games", "Puzzle Games", "Combat Games"]

if Category.count == 0
  categories.each do |c|
    Category.create(name: c)
    puts "created #{c} category"
  end
end

