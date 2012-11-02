class RemoveOldFieldsFromStudents < ActiveRecord::Migration
  def up
    remove_column :students, :description
    remove_column :students, :checkin_date
    remove_column :students, :grade
  end

  def down
    add_column :students, :description, :string
    add_column :students, :checkin_date, :datetime
    add_column :students, :grade, :number
  end
end
