class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :name, limit: 100
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
