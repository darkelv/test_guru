class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.references :category, null: false, index: true, foreign_key: true
      t.string :title, null: false
      t.integer :level, defult: 0

      t.timestamps
    end
  end
end
