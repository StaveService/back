class CreateBandAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :band_albums do |t|
      t.references :band, foreign_key: true
      t.references :album, foreign_key: true

      t.timestamps
      t.index %i[band_id album_id], unique: true
    end
  end
end
