require 'test/unit'

require_relative 'task1'
require_relative 'student_manager'

class LabTest < Test::Unit::TestCase
  def test_task_1
    results = []
    a = BigDecimal("0")
    b = BigDecimal("0")
    c = BigDecimal("1")
    x_start = BigDecimal("0")
    x_end = BigDecimal("2")
    dx = BigDecimal(".3")
    x_start.step(x_end, dx) do|x|
      results << function(a, b, c, x)
    end
    assert_equal(results, [0, 0, -1, -9, 6, 3, 2])

    results = []
    a = BigDecimal("1")
    b = BigDecimal("2")
    c = BigDecimal("3")
    x_start = BigDecimal("-1")
    x_end = BigDecimal("1")
    dx = BigDecimal(".25")
    x_start.step(x_end, dx) do|x|
      results << function(a, b, c, x)
    end
    actual = [3.0, 2.5625, 2.25, 2.0625, 0.0, 0.083, 0.166, 0.25, 0.3333]
    results.each_index do |index|
      assert_in_delta(results[index], actual[index])
    end
  end

  def test_task_2
    student1 = Student.new("HAVRADA", "DARYNA", "IHORIVNA", Date.new(2005, 07, 28), "1", "050237893", "FKNK", 1, "IPS-31")
    student2 = Student.new("MAKAROV", "IVAN", "MAKSYMOVYCH", Date.new(2004, 04, 17), "2", "067237893", "FKKK", 2, "R-29")
    student3 = Student.new("DULEBA", "YULIIA", "SERHIIVNA", Date.new(2003, 03, 12), "3", "557237893", "FKNK", 3, "K-38")
    manager = StudentManager.new([student1, student2, student3])
    assert_equal(manager.students_by_faculty("FKNK"), [student1, student3])
    assert_equal(manager.students_by_faculty("FKKK"), [student2])
    assert_equal(manager.students_by_faculty("F"), [])

    assert_equal(manager.students_faculties_years, [student2, student1, student3])

    assert_equal(manager.students_born_after_year(2002), [student1, student2, student3])
    assert_equal(manager.students_born_after_year(2003), [student1, student2])
    assert_equal(manager.students_born_after_year(2004), [student1])
    assert_equal(manager.students_born_after_year(2005), [])

    assert_equal(manager.students_by_group("IPS-31"), [student1])
    assert_equal(manager.students_by_group("R-29"), [student2])
    assert_equal(manager.students_by_group("K-38"), [student3])
    assert_equal(manager.students_by_group("K-19"), [])
  end
end