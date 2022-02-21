class RemoveMovieActorToMovies < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :movie_actor_id
  end
end
