class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.references :artist, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
