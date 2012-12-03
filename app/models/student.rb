class Student < ActiveRecord::Base
  has_many :students_events
  has_many :events, :through => :students_events
#validates :name, :presence => true
#validates :parentName, :presence => true
#validates :parentAddress, :presence => true
#validates :parentPhone, :presence => true
#validates :contactName, :presence => true
#validates :contactPhone, :presence => true
#validates :birthdate, :presence => true
#validates :grade, :presence => true
end