class MovieDirector < ApplicationRecord
  belongs_to :director
  has_many :movies
end
