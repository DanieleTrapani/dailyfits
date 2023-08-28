class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :temperature
      t.string :rain
      t.string :wind

      t.timestamps
    end
  end
end
