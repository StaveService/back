class CreateMusicLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :music_links do |t|
      t.integer :itunes
      t.string :twitter
      t.references :music, foreign_key: true

      t.timestamps
    end
  end
end
