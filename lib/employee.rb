class Employee < ActiveRecord::Base
  belongs_to(:division)
  has_many :assignments
  has_many :projects, :through => :assignments
  # has_and_belongs_to_many(:projects)



  # project.employee

  # has_many :projects
  # one to many
  # project can only belong to one employee
end
