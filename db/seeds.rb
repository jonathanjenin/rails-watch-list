# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Bookmark.delete_all
List.delete_all
Movie.delete_all

puts "Creating movies..."
20.times do
  movie = Movie.create!(
    title: Faker::Movie.title,
    overview: Faker::Movie.quote,
    poster_url: 'https://source.unsplash.com/random/?movie+poster',
    rating: rand(1..5)
  )
  puts "Created #{movie.title}"
end

puts '---------------------'

5.times do
  list = List.create!(
    name: Faker::Book.genre
  )
  puts "Created list for #{list.name}"
end

puts '---------------------'

movie_ids = Movie.pluck(:id)
list_ids = List.pluck(:id)
index = 0

20.times do
  bookmark = Bookmark.create!(
    comment: Faker::Restaurant.review,
    movie_id: movie_ids[index],
    list_id: list_ids[rand(1..5)]
  )
  index += 1
  puts "Created bookmark placing #{bookmark.movie.title} into #{bookmark.list.name}"
end

puts '---------------------'

puts 'Finished!'
