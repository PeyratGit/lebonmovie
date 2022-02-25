# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
puts "Destroying data..."

Movie.destroy_all
puts "movie destroyed"
User.destroy_all

puts "Done !"
urls = ["https://avatars.githubusercontent.com/u/52168643?v=4", "https://avatars.githubusercontent.com/u/95384661?v=4", "https://avatars.githubusercontent.com/u/96342482?v=4", "https://avatars.githubusercontent.com/u/78359730?v=4"]
emails = ["peyrat.clement@gmail.com","reynal.julie@gmail.com","ouarzazi.sidney@gmail.com","deguitre.canelle@gmail.com"]
passwords = ["adminp","adminr","admino","admind"]
firsts_names = ["Clément","Julie","Sidney","Canelle"]
lasts_names = ["Peyrat","Reynal","Ouarzazi","Deguitre"]
directors = ["Steven Spielberg", "Christopher Nolan", "Quentin Tarantino", " Martin Scorsese", "Alfred Hitchcock", "Stanley Kubrick", "Tim Burton", ""]
# genres = ["Horror", "Comedy", "Action", "Romance", "Blockbuster", "Drama", "Animation", "Fantasy", "Mystery", "Thriller", "Western"]
i = 0

puts "Creating users..."
4.times do
  User.create!(
    email: emails[i],
    password: passwords[i],
    first_name: firsts_names[i],
    last_name: lasts_names[i],
  )
  file_url = urls[i]
  users_models = User.all
  users_models[i].photo.attach(
    io: URI.open(file_url),
    filename: "file#{i}.jpg"
  )
  i += 1
end
puts "Users creation done !"
users = User.all

require 'open-uri'

movies = JSON.parse(URI.open("http://tmdb.lewagon.com/movie/popular").read)["results"]

puts "Creating movies..."
i = 0
movie_genre = ""
movie_director = ""

movies.first(50).each do |movie|
  crew_list = JSON.parse(URI.open("http://tmdb.lewagon.com/movie/#{movie['id']}/credits").read)["crew"]
  crew_list.each do |crew_member|
    if crew_member['job'] == "Director"
      movie_director = crew_member['name']
    end
  end
  genre_list = JSON.parse(URI.open("http://tmdb.lewagon.com/genre/movie/list").read)["genres"]
  genre_list.each do |genre|
    if genre["id"] == movie["genre_ids"][0]
      movie_genre = genre["name"]
    end
  end

  Movie.create!(
    title: movie['title'],
    year: movie['release_date'].first(4),
    imdb_rating: movie["vote_average"],
    description: movie['overview'],
    director: movie_director,
    genre: movie_genre,
    user_id: users.sample.id,
    price: rand(1.00..10).round(2),
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
