require_relative 'publication'

class TermPaperPublication < Publication
  attr_accessor :year_of_study, :mentor

  def initialize(title, author, text, links, year_of_study, mentor)
    super(title, author, text, links)
    @year_of_study = year_of_study
    @mentor = mentor
  end
end
