class CreateUserLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_links do |t|
      t.references :user
      t.string :twitter

      t.timestamps
    end
  end
end
