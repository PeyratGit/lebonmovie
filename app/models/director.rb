class Director < ApplicationRecord
  has_many :movies, through: :movie_directors
  validates :name, presence: true
end
