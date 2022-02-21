class Movie < ApplicationRecord
  belongs_to :movie_director, optional: true
  belongs_to :movie_actor, optional: true
  belongs_to :user
  validates :title, presence: true
  validates :description, length: { minimum: 10 }
end
