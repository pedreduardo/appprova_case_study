class AddFieldsToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :classification, :string, limit: 10
    add_column :students, :enem_number, :string, limit: 60
    add_column :students, :grade, :string, limit: 60
    add_column :students, :obs, :string
    add_column :students, :course, :string, limit: 100
    add_column :students, :campus, :string, limit: 300
    add_column :students, :university, :string, limit: 300

    add_index :students, :name
    add_index :students, :course
    add_index :students, :university
  end
end
