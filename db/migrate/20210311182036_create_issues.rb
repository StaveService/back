class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.references :music, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
