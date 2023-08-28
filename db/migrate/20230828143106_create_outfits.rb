class CreateOutfits < ActiveRecord::Migration[7.0]
  def change
    create_table :outfits do |t|
      t.text :description
      t.references :users
      t.references :tags

      t.timestamps
    end
  end
end
