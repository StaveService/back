class CreateArtistBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_bookmarks do |t|
      t.references :user, foreign_key: true
      t.references :artist, foreign_key: true

      t.timestamps
      t.index %i[user_id artist_id], unique: true
    end
  end
end
