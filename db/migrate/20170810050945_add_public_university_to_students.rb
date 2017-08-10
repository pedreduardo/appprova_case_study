class AddPublicUniversityToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :public_university, :boolean
  end
end
