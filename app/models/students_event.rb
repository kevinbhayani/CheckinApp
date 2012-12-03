class StudentsEvent < ActiveRecord::Base
  validates_uniqueness_of :student_id, :scope => :event_id
  belongs_to :event
  belongs_to :student
end