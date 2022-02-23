# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying data..."

Movie.destroy_all
User.destroy_all

puts "Done !"

emails = ["peyrat.clement@gmail.com","reynal.julie@gmail.com","ouarzazi.sidney@gmail.com","deguitre.canelle@gmail.com"]
passwords = ["123456","azerty","nbvcxw","qsdfgh"]
firsts_names = ["clément","julie","sidney","canelle"]
lasts_names = ["peyrat","reynal","ouarzazi","deguitre"]
directors = ["Steven Spielberg", "Christopher Nolan", "Quentin Tarantino", " Martin Scorsese", "Alfred Hitchcock", "Stanley Kubrick", "Tim Burton", ""]
genres = ["Horror", "Comedy", "Action", "Romance", "Blockbuster", "Drama", "Animation", "Fantasy", "Mystery", "Thriller", "Western"]
i = 0

puts "Creating users..."
4.times do
  User.create!(
    email: emails[i],
    password: passwords[i],
    first_name: firsts_names[i],
    last_name: lasts_names[i],
  )
  i += 1
end
puts "Users creation done !"
users = User.all

require 'open-uri'

movies = JSON.parse(URI.open("http://tmdb.lewagon.com/movie/popular").read)["results"]

puts "Creating movies..."
i = 0
movies.first(11).each do |movie|
  Movie.create!(
    title: movie['title'],
    year: movie['release_date'].first(4),
    imdb_rating: movie["vote_average"],
    description: movie['overview'],
    director: directors.sample,
    genre: genres.sample,
    user_id: users.sample.id,
    price: rand(10),
  )
  file_url = "https://www.themoviedb.org/t/p/w500#{movie["poster_path"]}"
  movies_models = Movie.all
  movies_models[i].photo.attach(
    io: URI.open(file_url),
    filename: "file#{i}.jpg"
  )
  i += 1
end

puts "Movies creation done !"
# puts Movie(1).photo.key
