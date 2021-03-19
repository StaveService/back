class CreateArtistBands < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_bands do |t|
      t.references :artist, foreign_key: true
      t.references :band, foreign_key: true

      t.timestamps
    end
  end
end
