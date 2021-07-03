class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title, default: '', null: false
      t.integer :bookmarks_count

      t.timestamps
    end
  end
end
