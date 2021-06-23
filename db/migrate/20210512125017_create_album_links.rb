class CreateAlbumLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :album_links do |t|
      t.integer :itunes
      t.string :spotify
      t.references :album, foreign_key: true

      t.timestamps
    end
  end
end
