class CreateAnswer < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :question, null: false, index: true, foreign_key: true
      t.string :body, null: false
      t.boolean :correct, default: false

      t.timestamps
    end
  end
end
