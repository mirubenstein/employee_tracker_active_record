require 'active_record'
require './lib/employee'
require './lib/project'
require './lib/division'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def header
  puts "Employee Tracker 3000"
end

def main_menu
  header
  choice = nil
  until choice == 'X'
    puts "E > Employee Menu"
    puts "D > Divisions Menu"
    puts "P > Projects Menu"
    puts "X > Exit Program"
    choice = gets.chomp.upcase
    case choice
      when 'E' then employee_menu
      when 'D' then divisions_menu
      when 'P' then projects_menu
      when 'X' then "Have a fantastic day!"
      else "Invalid input. Try again."
    end
  end
end

def employee_menu
  choice = nil
  until choice == 'X'
    puts "A > Add Employee"
    puts "L > List Employee"
    puts "U > Update Employee"
    puts "D > Delete Employee"
    puts "X > Exit Program"
    choice = gets.chomp.upcase
    case choice
      when 'A' then add_employee
      when 'L' then
        employees = Employee.all
        employees.each { |employee| puts employee.name }
      when 'U' then
      when 'D' then
      when 'X' then "Have a fantastic day!"
      else "Invalid input. Try again."
    end
  end
end

def add_employee
  puts "Please enter name of new employee!"
  choice = gets.chomp
  Employee.new(name: choice).save
  puts "#{choice} has been added."
end
main_menu
