class AddNameAndRoleToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :name, :string, limit: 100
    add_column :admins, :role, :integer
  end
end
