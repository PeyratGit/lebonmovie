class PurchasesController < ApplicationController
  def index

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
      redirect_to purchase_path(@purchase)
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
