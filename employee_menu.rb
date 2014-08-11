def employee_menu
  choice = nil
  puts "A > Add Employee"
  puts "L > List Employee"
  puts "U > Update Employee"
  puts "D > Delete Employee"
  puts "R > Return to Main Menu"
  choice = gets.chomp.upcase
  case choice
    when 'A' then add_employee
    when 'L' then
      employees = Employee.all
      employees.each { |employee| puts employee.id.to_s + ")  " + employee.name }
    when 'U' then update_employee
    when 'D' then delete_employee
    when 'R'
      puts "Returning..."
      sleep 1
    else
      puts "Invalid input. Try again."
      employee_menu
  end
end

def add_employee
  puts "Please enter name of new employee!"
  name = gets.chomp
  divisions = Division.all
  divisions.each { |division| puts division.id.to_s + ")  " + division.name }
  puts "What Division (ID) will they be joining!?"
  division_id = gets.chomp.to_i
  division = Division.where(:id => division_id).first
  p division
  division.employees.new({:name => name})
  division.save
  puts "#{name} has been added."
end

def update_employee
  employees = Employee.all
  employees.each { |employee| puts employee.id.to_s + ")  " + employee.name }
  puts "Please enter ID of employee to change!"
  employee_id = gets.chomp.to_i
  puts "Please enter employee's new legal name!"
  new_name = gets.chomp
  employee = Employee.where(:id => employee_id).first
  employee.update(name: new_name)
  puts "Employee Number #{employee_id} has been updated!"
  puts "New name: #{employee.name}"
end

def delete_employee
  employees = Employee.all
  employees.each { |employee| puts employee.id.to_s + ")  " + employee.name }
  puts "Please enter ID of employee to delete!"
  employee_id = gets.chomp.to_i
  employee = Employee.where(:id => employee_id).first
  employee.destroy
  puts "Employee Number #{employee_id} has been destroyed!"
end
