class Event < ActiveRecord::Base
  serialize :students, :checked_in
  validates :name, :presence => true
  validates :time, :presence => true
end
