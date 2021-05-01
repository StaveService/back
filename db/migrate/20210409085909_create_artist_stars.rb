class CreateArtistStars < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_stars do |t|
      t.references :user, foreign_key: true
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end