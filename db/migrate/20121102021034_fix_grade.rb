class FixGrade < ActiveRecord::Migration
  def change
    remove_column :students, :age
    add_column :students, :grade, :string
  end
end
