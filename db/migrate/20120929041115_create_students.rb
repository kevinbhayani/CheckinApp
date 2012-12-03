class CreateStudents < ActiveRecord::Migration
  def up
    create_table 'students' do |t|
      t.string 'name'
      t.string 'age'
      t.text 'description'
      t.datetime 'checkin_date'
      t.string   "notes"
      t.string   "parentName"
      t.string   "parentAddress"
      t.string   "parentPhone"
      t.string   "contactName"
      t.string   "contactPhone"
      t.datetime "birthdate"
      t.string   "grade"
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end

  def down
      drop_table 'students' # deletes the whole table and all its data!
  end
end
