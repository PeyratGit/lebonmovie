class RemoveMovieDirectorToMovies < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :movie_director_id
  end
end
