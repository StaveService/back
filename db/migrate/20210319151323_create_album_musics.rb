class CreateAlbumMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :album_musics do |t|
      t.references :album, foreign_key: true
      t.references :music, foreign_key: true

      t.timestamps
    end
  end
end
