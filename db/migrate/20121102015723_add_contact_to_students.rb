class AddContactToStudents < ActiveRecord::Migration
  def change
    add_column :students, :contactName, :string
    add_column :students, :contactPhone, :string
  end
end
