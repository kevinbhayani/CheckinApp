class Event < ActiveRecord::Base
  has_many :students_events
  has_many :students, :through => :students_events
  validates :name, :presence => true
  validates :time, :presence => true
end
