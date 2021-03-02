class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.artist :references
      t.string :name
      t.string :country
      t.date :release_date

      t.timestamps
    end
  end
end
