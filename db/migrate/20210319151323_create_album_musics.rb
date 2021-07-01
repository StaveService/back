class CreateAlbumMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :album_musics do |t|
      t.references :album, foreign_key: true
      t.references :music, foreign_key: true

      t.timestamps
      t.index %i[album_id music_id], unique: true
    end
  end
end
