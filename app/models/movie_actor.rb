class MovieActor < ApplicationRecord
  belongs_to :actor
  has_many :movies
end
