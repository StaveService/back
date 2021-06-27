class CreateArtistAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_albums do |t|
      t.references :artist, foreign_key: true
      t.references :album, foreign_key: true

      t.timestamps
      t.index [:artist_id, :album_id], unique: true
    end
  end
end
