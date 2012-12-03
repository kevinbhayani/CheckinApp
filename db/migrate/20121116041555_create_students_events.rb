class CreateStudentsEvents < ActiveRecord::Migration
  def up
    create_table :students_events do |t|
      t.references :student
      t.references :event
      t.string :checkin_time
      t.string :checkout_time
    end
  end
end
