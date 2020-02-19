class CreateQuestion < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :test, null: false, index: true, foreign_key: true
      t.string :body, null: false

      t.timestamps
    end
  end
end
