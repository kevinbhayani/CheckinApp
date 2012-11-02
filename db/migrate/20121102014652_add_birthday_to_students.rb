class AddBirthdayToStudents < ActiveRecord::Migration
  def change
    add_column :students, :birthdate, :string
  end
end
