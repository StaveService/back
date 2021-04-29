class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title, default: "", null: false
      t.integer :itunes_collection_id

      t.timestamps
    end
  end
end
