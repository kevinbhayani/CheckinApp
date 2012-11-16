class Event < ActiveRecord::Base
  serialize :students
  validates :name, :presence => true
  validates :time, :presence => true
end
