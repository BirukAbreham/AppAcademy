class Employee
  
  attr_reader :salary, :name

  def initialize(name, salary)
    @name = name
    @salary = salary

  end

  def bonus(multiplier)
    return (self.salary)*multiplier
  end  

end


class Manager < Employee

  def initialize(name, salary, *employees)
    super(name, salary)
    @assigned_employees = employees
  end

  def bonus(multiplier)
    bonus = 0
    
    @assigned_employees.each do |emp|
      bonus += emp.salary
    end

    return bonus*multiplier
  end

end

david = Employee.new("David", 10000)
shawna = Employee.new("Shawna", 12000)
darren = Manager.new("Darren", 78000, shawna, david)
ned = Manager.new("Ned", 1000000, darren, shawna, david)

puts "Ned bonus #{ned.bonus(5)}"  # 500000
puts "Darren bonus #{darren.bonus(4)}" # 88000
puts "David bonus #{david.bonus(3)}" # 30000