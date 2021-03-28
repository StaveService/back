class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title, default: "", null: false
      t.date :release_date

      t.timestamps
    end
  end
end
