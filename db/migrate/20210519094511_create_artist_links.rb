class CreateArtistLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_links do |t|
      t.references :artist, foreign_key: true
      t.integer :itunes
      t.string :twitter

      t.timestamps
    end
  end
end
