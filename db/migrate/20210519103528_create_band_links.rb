class CreateBandLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :band_links do |t|
      t.references :band, foreign_key: true
      t.string :itunes

      t.timestamps
    end
  end
end
