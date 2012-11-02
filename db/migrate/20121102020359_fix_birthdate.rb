class FixBirthdate < ActiveRecord::Migration
  def change
    remove_column :students, :birthdate
    add_column :students, :birthdate, :datetime
  end

end
