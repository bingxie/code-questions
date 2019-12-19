class Solution
  def initialize
    @employees = {}
    @manager_map = Hash.new { |h, key| h[key] = [] }
  end

  def print_manager_employees(input)
    parse_input(input)

    @manager_map['0'].each do |top_manager|
      puts @employees[top_manager].name
      print_members(top_manager, '-')
    end
  end

  private

  def parse_input(input)
    persons = input.split(', ')

    persons.each do |person|
      values = person.split(':')
      employee = Employee.new(*values)

      @employees[employee.id] = employee
      @manager_map[employee.manager_id].push employee.id
    end
  end

  def print_members(manager_id, prefix)
    @manager_map[manager_id]&.each do |employee_id|
      puts "#{prefix} #{@employees[employee_id].name}"

      print_members(employee_id, prefix * 2)
    end
  end
end

Employee = Struct.new(:id, :name, :manager_id) do
end

# 4: [1, 2]
# 0: [4]
# 1: [3]

input = '1:Max:4, 4:Ann:0, 2:Jim:4, 3:Tom:1'
Solution.new.print_manager_employees(input)
