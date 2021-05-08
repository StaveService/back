class CreateLyristMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :lyrist_musics do |t|
      t.references :artist, foreign_key: true
      t.references :music, foreign_key: true

      t.timestamps
    end
  end
end
