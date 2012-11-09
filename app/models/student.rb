class Student < ActiveRecord::Base
  validates :name, :presence => true
  validates :parentName, :presence => true
  validates :parentAddress, :presence => true
  validates :parentPhone, :presence => true
  validates :contactName, :presence => true
  validates :contactPhone, :presence => true
  validates :birthdate, :presence => true
  validates :grade, :presence => true
end
