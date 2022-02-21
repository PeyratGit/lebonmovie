class CreateMovieActors < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_actors do |t|
      t.references :actor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
