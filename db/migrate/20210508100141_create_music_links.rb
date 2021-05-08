class CreateMusicLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :music_links do |t|
      t.references :artist, foreign_key: true
      t.references :platform, foreign_key: true

      t.timestamps
    end
  end
end
