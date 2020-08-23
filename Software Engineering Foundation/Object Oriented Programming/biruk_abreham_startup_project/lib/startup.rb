require "employee"

class Startup
  
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end
  
  def valid_title?(title)
    return @salaries.has_key?(title)
  end

  def >(start_up)
    if self.funding > start_up.funding
      return true
    else
      return false
    end
  end

  def hire(employee_name, title)
    if self.valid_title?(title)
      @employees << Employee.new(employee_name, title)
    else
      raise "invalid title of employee"
    end
  end

  def size
    return @employees.length
  end

  def pay_employee(employee)
    if self.funding > self.salaries[employee.title]
      employee.pay(self.salaries[employee.title])
      @funding -= self.salaries[employee.title]
    else
      raise "Not enough funding"
    end
  end

  def payday
    self.employees.each do |employee|
      self.pay_employee(employee)
    end
  end

  def average_salary
    total = 0
    self.employees.each do |employee|
      total += self.salaries[employee.title]
    end

    return total / self.employees.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(start_up)
    @funding += start_up.funding
    
    start_up.salaries.each do |key, val|
      if !self.salaries.include?(key)
        @salaries[key] = val
      end
    end
    
    @employees += start_up.employees
    start_up.close
  end

end
