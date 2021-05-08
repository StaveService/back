class CreateMusicLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :music_links do |t|
      t.references :music, foreign_key: true
      t.references :link, foreign_key: true

      t.timestamps
    end
  end
end
