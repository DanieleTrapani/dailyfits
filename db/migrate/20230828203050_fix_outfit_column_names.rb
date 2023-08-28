class FixOutfitColumnNames < ActiveRecord::Migration[7.0]
  def change
    rename_column :outfits, :users_id, :user_id
    rename_column :outfits, :tags_id, :tag_id
  end
end
