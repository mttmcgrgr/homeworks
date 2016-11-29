class Employee

  attr_accessor :salary, :employees

  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
    @employees = []
    add_employee(boss) unless boss.nil?
  end

  def add_employee(boss)
    boss.employees << self
  end

  def bonus(multiplier)
    salary * multiplier
  end

end

class Manager < Employee

  attr_accessor :name, :title, :salary, :boss, :employees

  def initialize(name, title, salary, boss)
    @employees = []
    super(name, title, salary, boss)
  end

  def bonus(multiplier)
    #base case
    return salary * multiplier if employees.empty?

    total_sum = 0
    employees.each do |employee|

      if employee.employees.empty?
        total_sum = total_sum + employee.salary
      else
        total_sum = total_sum + employee.salary
        total_sum += employee.bonus(multiplier) / multiplier
      end
    end

    total_sum * multiplier
  end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
david = Employee.new("David", "TA", 10000, darren)
shawna = Employee.new("Sharon", "TA", 12000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
