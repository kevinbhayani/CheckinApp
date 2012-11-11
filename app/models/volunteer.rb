class Volunteer < ActiveRecord::Base
  validates :name, :presence => true
  validates :pin, :presence => true
end
