class Event < ActiveRecord::Base
  serialize :students
<<<<<<< HEAD
=======
  validates :name, :presence => true
  validates :time, :presence => true
>>>>>>> 526777241f19b950f3081fb7e85580ea57918682
end
