class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.references :user, foreign_key: true
      t.string :name, default: "", null: false
      t.string :twitter
      t.string :instagram
      t.string :spotify
      t.string :itunes
      t.string :youtube

      t.timestamps
    end
  end
end
