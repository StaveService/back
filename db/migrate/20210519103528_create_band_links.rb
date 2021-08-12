class CreateBandLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :band_links do |t|
      t.references :band, foreign_key: true
      t.integer :itunes
      t.string :twitter
      t.string :spotify
      t.integer :wikipedia
      t.string :youtube

      t.timestamps
    end
  end
end
