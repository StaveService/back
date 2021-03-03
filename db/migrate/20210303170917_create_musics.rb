class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.references :artist, foreign_key: true
      t.references :user, foreign_key: true
      t.references :album, foreign_key: true
      t.string :title, default: "", null: false
      t.string :composer, default: "", null: false
      t.string :lyrist, default: "", null: false
      t.number :bpm
      t.time :time

      t.timestamps
    end
  end
end
