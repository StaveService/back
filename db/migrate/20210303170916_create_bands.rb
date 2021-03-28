class CreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :bands do |t|
      t.string :name
      t.integer :itunes_artist_id

      t.timestamps
    end
  end
end
