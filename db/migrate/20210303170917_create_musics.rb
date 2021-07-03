class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.references :user, foreign_key: true
      t.references :band, foreign_key: true
      t.string :title, default: '', null: false
      t.string :tab, default: '', null: false
      t.integer :bookmarks_count

      t.timestamps
    end
  end
end
