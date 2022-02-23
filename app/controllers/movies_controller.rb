class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def action
    @movies = Movie.where(genre: "Action")
  end

  def thriller
    @movies = Movie.where(genre: "Thriller")
  end

  def horror
    @movies = Movie.where(genre: "Horror")
  end

  def comedy
    @movies = Movie.where(genre: "Comedy")
  end

  def animation
    @movies = Movie.where(genre: "Animation")
  end

  def crime
    @movies = Movie.where(genre: "Crime")
  end

  def fantasy
    @movies = Movie.where(genre: "Fantasy")
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :price, :user_id, :description, :year, :director, :imdb_rating, :genre)
  end
end
