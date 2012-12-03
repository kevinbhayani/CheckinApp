class CreateStudentsEvents < ActiveRecord::Migration
  def up
    create_table :students_events do |t|
      t.references :student
      t.references :event
      t.boolean :checkin_status, :default => "true"
    end
  end
end
