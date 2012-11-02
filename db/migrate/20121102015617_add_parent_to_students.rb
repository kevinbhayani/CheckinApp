class AddParentToStudents < ActiveRecord::Migration
  def change
    add_column :students, :parentName, :string
    add_column :students, :parentAddress, :string
    add_column :students, :parentPhone, :string
  end
end
