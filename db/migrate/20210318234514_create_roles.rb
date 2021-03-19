class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.references :artist, foreign_key: true
      t.references :music, foreign_key: true
      t.integer :role

      t.timestamps
    end
  end
end
