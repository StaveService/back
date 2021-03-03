class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.references :artist, foreign_key: true
      t.string :title, default: "", null: false
      t.string :country
      t.date :release_date

      t.timestamps
    end
  end
end
