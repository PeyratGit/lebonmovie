class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo
  has_many :movies
  has_many :purchases
  # has_many :purchases_requests, through: :movies, class_name: "Purchase", source: :purchases
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  def average_rating
    n = 0
    sum = 0
    movies.each do |movie|
      unless movie.purchases.first.nil? || movie.purchases.first.rating.nil?
        n += 1
        sum += movie.purchases.first.rating
      end
    end
    if n == 0
      "-"
    else
      sum.fdiv(n).round(1)
    end
  end
end
