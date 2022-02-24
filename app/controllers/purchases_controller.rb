class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all
  end

  def bookings
    @purchases = Purchase.all
  end

  def requests
    @purchases = Purchase.all
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @purchase = Purchase.new
    @purchase.movie = @movie
    @purchase.user = current_user
    @purchase.status = "pending"
    if @purchase.save
      redirect_to bookings_purchases_path
    else
      render "movies/show"
    end
  end

  def edit
  end

  def update
  end
  
  def rate
  end

end
