class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name, default: "", null: false
      t.integer :itunes_artist_id
      t.timestamps
    end
  end
end
