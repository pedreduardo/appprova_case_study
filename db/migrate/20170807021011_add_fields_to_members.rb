class AddFieldsToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :first_name, :string, limit: 40
    add_column :members, :last_name, :string, limit: 60
    add_column :members, :cell_phone, :string, limit: 60
    add_column :members, :name_school, :string, limit: 100
    add_column :members, :cnpj_school, :string, limit: 60

    add_index :members, :cnpj_school, unique: true
  end
end
