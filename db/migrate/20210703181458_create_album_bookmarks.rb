class CreateAlbumBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :album_bookmarks do |t|
      t.references :album, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
      t.index %i[album_id user_id], unique: true
    end
  end
end
