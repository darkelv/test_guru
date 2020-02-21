class AddAuthorToTest < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :user, index: true, null: false, foreign_key: true
  end
end
