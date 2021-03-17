class CreateComposers < ActiveRecord::Migration[5.2]
  def change
    create_table :composers do |t|
      t.references :artist, foreign_key: true
      t.references :music, foreign_key: true

      t.timestamps
    end
  end
end
