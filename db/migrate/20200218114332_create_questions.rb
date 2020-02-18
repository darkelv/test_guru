class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :test, null: false, index: true
      t.string :body, null: false

      t.timestamps
    end
  end
end
