class CreateArtistMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_musics do |t|
      t.references :artist, foreign_key: true
      t.references :music, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
