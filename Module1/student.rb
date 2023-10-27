require 'date'

class Student
  attr_accessor :id, :last_name, :first_name, :patronymic, :birth_date, :address, :phone_number, :faculty, :year, :group
  @@id = 0

  def initialize(last_name, first_name, patronymic, birth_date, address, phone_number, faculty, year, group)
    @id = @@id
    ++@@id
    @last_name = last_name
    @first_name = first_name
    @patronymic = patronymic
    @birth_date = birth_date
    @address = address
    @phone_number = phone_number
    @faculty = faculty
    @year = year
    @group = group
  end

  def to_s
    "Student{id=" + @id.to_s + "; last_name=" + @last_name.to_s + "; first_name=" + @first_name.to_s + "; patronymic=" + @patronymic.to_s + "; birth_date=" + @birth_date.to_s + "; address=" + @address.to_s + "; phone_number=" + @phone_number.to_s + "; faculty=" + @faculty.to_s + "; year=" + @year.to_s + "; group=" + @group.to_s + "}"
  end
end