class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.references :user, foreign_key: true
      t.references :band, foreign_key: true
      t.string :title, default: "", null: false
      t.integer :itunes_track_id

      t.timestamps
    end
  end
end
