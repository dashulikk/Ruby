require_relative 'publication'

class JournalistPublication < Publication
  attr_accessor :paper_name, :journalistic_scope
  def initialize(title, author, text, links, paper_name, journalistic_scope)
    super(title, author, text, links)
    @paper_name = paper_name
    @journalistic_scope = journalistic_scope
  end
end
