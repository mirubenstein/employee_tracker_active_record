def project_menu
  choice = nil
  puts "A > Add project"
  puts "L > List project"
  puts "U > Update project"
  puts "D > Delete project"
  puts "Q > Add a user to a project"
  puts "R > Return to Main Menu"
  choice = gets.chomp.upcase
  case choice
    when 'A' then add_project
    when 'Q' then add_project_user
    when 'L' then
      projects = project.all
      projects.each { |project| puts project.id.to_s + ")  " + project.name }
    when 'U' then update_project
    when 'D' then delete_project
    when 'R'
      puts "Returning..."
      sleep 1
    else
      puts "Invalid input. Try again."
      project_menu
  end
end

def add_project
  puts "Please enter name of new project!"
  choice = gets.chomp
  Project.new(name: choice).save
  puts "#{choice} has been added."
end

def add_project_user
  employees = Employee.all
  employees.each { |employee| puts employee.id.to_s + ")  " + employee.name }
  puts "Please enter the ID of the employee joing this marvelous project!"
  user_id = gets.chomp.to_i
  puts "\n"
  projects = Project.all
  projects.each { |project| puts project.id.to_s + ")  " + project.name }
  puts "Please enter the ID of the project!"
  project_id = gets.chomp.to_i
  employee = Employee.where(:id => user_id).first
  project1 = Project.where(:id => project_id).first
  binding.pry
  employee.projects << project1
  puts "Project #{project_id} updated!"
end

def update_project
  projects = Project.all
  projects.each { |project| puts project.id.to_s + ")  " + project.name }
  puts "Please enter ID of project to change!"
  project_id = gets.chomp.to_i
  puts "Please enter project's new legal name!"
  new_name = gets.chomp
  project = Project.where(:id => project_id).first
  project.update(name: new_name)
  puts "Project Number #{project_id} has been updated!"
  puts "New name: #{project.name}"
end

def delete_project
  projects = Project.all
  projects.each { |project| puts project.id.to_s + ")  " + project.name }
  puts "Please enter ID of project to delete!"
  project_id = gets.chomp.to_i
  project = Project.where(:id => project_id).first
  project.destroy
  puts "project Number #{project_id} has been destroyed!"
end

