class AddUserBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :user_badges do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :badge, index: true, foreign_key: true, null: false
    end
  end
end
