class AddUniqueIndex < ActiveRecord::Migration[5.2]
  def change
    add_index(:users, [:name, :email], unique: true)
    add_index(:tests, [:title, :level], unique: true, name: 'by_level_and_title')
  end
end
