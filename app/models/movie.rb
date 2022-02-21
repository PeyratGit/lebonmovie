class Movie < ApplicationRecord
  belongs_to :movie_director
  belongs_to :movie_actor
  belongs_to :user
  validates :title, presence: true
  validates :description, length: { minimum: 10 }
end
