class RemoveLocationFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :location, :string
  end
end
