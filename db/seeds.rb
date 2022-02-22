# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

emails = ["clement.peyrat@gmail.com","reynal.julie@gmail.com","ouarzazi.sidney@gmail.com","deguitre.canelle@gmail.com"]
passwords = ["123456","azerty","nbvcxw","qsdfgh"]
firsts_names = ["clément","julie","sidney","canelle"]
lasts_names = ["peyrat","reynal","ouarzazi","deguitre"]
i = 0

4.times do
  User.create!(
    email: emails[i],
    password: passwords[i],
    first_name: firsts_names[i],
    last_name: lasts_names[i],
  )
  i += 1
end

users = User.all

require 'open-uri'

movies= JSON.parse(URI.open("http://tmdb.lewagon.com/movie/popular").read)["results"]

movies.each do |movie|
  Movie.create!(
    title: movie['title'],
    year: movie['release_date'].first(4),
    imdb_rating: movie["vote_average"],
    description: movie['overview'],
    director: "director placeholder",
    genre: "genre placeholder",
    user_id: users.sample.id,
  )
end
