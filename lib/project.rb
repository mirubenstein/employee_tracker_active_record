class Project < ActiveRecord::Base
  has_many :assignments
  has_many :employees, :through => :assignments
  # has_and_belongs_to_many(:employee)
end
