class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.integer :year
      t.float :imdb_rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
