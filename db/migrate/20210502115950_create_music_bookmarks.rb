class CreateMusicBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :music_bookmarks do |t|
      t.references :user, foreign_key: true
      t.references :music, foreign_key: true

      t.timestamps
      t.index [:user_id, :music_id], unique: true
    end
  end
end
