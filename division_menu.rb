def division_menu
  choice = nil
  puts "A > Add division"
  puts "L > List division"
  puts "U > Update division"
  puts "D > Delete division"
  puts "R > Return to Main Menu"
  choice = gets.chomp.upcase
  case choice
  when 'A' then add_division
  when 'L' then
    divisions = Division.all
    divisions.each { |division| puts division.id.to_s + ")  " + division.name }
  when 'U' then update_division
  when 'D' then delete_division
  when 'R'
    puts "Returning..."
    sleep 1
  else
    puts "Invalid input. Try again."
    employee_menu
  end
end

def add_division
  puts "Please enter name of new division!"
  choice = gets.chomp
  Division.new(name: choice).save
  puts "#{choice} has been added."
end

def update_division
  divisions = Division.all
  divisions.each { |division| puts division.id.to_s + ")  " + division.name }
  puts "Please enter ID of division to change!"
  division_id = gets.chomp.to_i
  puts "Please enter division's new legal name!"
  new_name = gets.chomp
  division = Division.where(:id => division_id).first
  division.update(name: new_name)
  puts "division Number #{division_id} has been updated!"
  puts "New name: #{division.name}"
end

def delete_division
  divisions = Division.all
  divisions.each { |division| puts division.id.to_s + ")  " + division.name }
  puts "Please enter ID of division to delete!"
  division_id = gets.chomp.to_i
  division = Division.where(:id => division_id).first
  division.destroy
  puts "Division Number #{division_id} has been destroyed!"
end
