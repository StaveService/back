class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name, default: '', null: false
      t.integer :bookmarks_count

      t.timestamps
    end
  end
end
