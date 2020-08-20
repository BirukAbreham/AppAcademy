class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |hash, key| hash[key] = [] }
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    if (@student_capacity > @students.length)
      @students << student
      return true
    end
    return false
  end
  
  def enrolled?(student)
    return @students.include?(student)
  end
  
  def student_to_teacher_ratio
    return @students.length / @teachers.length
  end

  def add_grade(student, grade)
    if @students.include?(student)
      @grades[student] << grade
      return true
    end
    return false
  end

  def num_grades(student)
    return @grades[student].length
  end

  def average_grade(student)
    if @students.include?(student) && @grades[student].length > 0
      return @grades[student].sum / @grades[student].length
    end
    return nil
  end
end
