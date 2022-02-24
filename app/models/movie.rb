class Movie < ApplicationRecord
  belongs_to :movie_director, optional: true
  belongs_to :movie_actor, optional: true
  belongs_to :user
  has_one_attached :photo
  validates :title, :description, presence: true
  validates :description, length: { minimum: 10 }
  include PgSearch::Model
  pg_search_scope :search_full_text,
    against: [ :title, :genre, :year, :imdb_rating, :description, :director],
    using: {
      tsearch: { prefix: true}
    }
end
