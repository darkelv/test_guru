class AddBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title, index: true, null: false, unique: true
      t.string :image, null: false
      t.integer :condition, null: false, default: 0
      t.string :description
    end
  end
end
