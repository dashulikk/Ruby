require_relative 'student'
class StudentManager
  def initialize(students)
    @students = students
  end

  def students_by_faculty(faculty)
    @students.select {|student| student.faculty == faculty }
  end

  def students_faculties_years
    @students.sort do |stud1, stud2|
      if stud1.faculty != stud2.faculty
        stud1.faculty <=> stud2.faculty
      else
        stud1.group <=> stud2.group
      end
    end
  end

  def students_born_after_year(year)
    @students.select {|student| student.birth_date.year > year}
  end

  def students_by_group(group)
    @students.select {|student| student.group == group}
  end
end