class AddFieldsToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :classification, :string, limit: 10
    add_column :members, :enem_number, :string, limit: 60
    add_column :members, :grade, :string, limit: 60
    add_column :members, :obs, :string
    add_column :members, :course, :string, limit: 100
    add_column :members, :campus, :string, limit: 300
    add_column :members, :university, :string, limit: 300

    add_index :members, :name
    add_index :members, :course
    add_index :members, :university
  end
end
