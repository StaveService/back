class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :youtube
      t.string :twitter
      t.integer :wikipedia
      t.string :official
      t.integer :itunes

      t.timestamps
    end
  end
end
