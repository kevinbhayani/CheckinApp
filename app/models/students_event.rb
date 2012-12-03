class StudentsEvent < ActiveRecord::Base
  validates_uniqueness_of :student_id, :scope => [:event_id, :checkin_status]
  belongs_to :event
  belongs_to :student
end