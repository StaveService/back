class CreateBandBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :band_bookmarks do |t|
      t.references :user, foreign_key: true
      t.references :band, foreign_key: true

      t.timestamps
    end
  end
end
