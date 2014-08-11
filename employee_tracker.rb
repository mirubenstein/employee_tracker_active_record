require 'active_record'
require'pry'

require './lib/employee'
require './lib/project'
require './lib/division'
require './employee_menu'
require './division_menu'
require './project_menu'
require './lib/assignment'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def header
  puts "Employee Tracker 3000"
end

def main_menu
  header
  choice = nil
    puts "E > Employee Menu" if (Division.all.length > 0)
    puts "D > Divisions Menu"
    puts "P > Projects Menu" if (Employee.all.length > 0)
    puts "X > Exit Program"
    choice = gets.chomp.upcase
    case choice
      when 'E' then employee_menu
      when 'D' then division_menu
      when 'P' then project_menu
      when 'X'
        puts "Have a fantastic day!"
        exit
      else
        puts "Invalid input. Try again."
        sleep 1
    end
  main_menu
end

main_menu
