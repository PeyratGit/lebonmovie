class AddAverageToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :average, :float
  end
end
