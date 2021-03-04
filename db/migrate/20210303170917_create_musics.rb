class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.references :user, foreign_key: true
      t.references :album, foreign_key: true
      t.string :title, default: "", null: false
      t.integer :bpm
      t.string :length

      t.timestamps
    end
  end
end
