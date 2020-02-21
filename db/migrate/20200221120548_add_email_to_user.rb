class AddEmailToUser < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :email, :string, null: false, default: nil
  end
end
