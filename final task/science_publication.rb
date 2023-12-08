require_relative 'publication'

class SciencePublication < Publication
  attr_accessor :companions, :scientific_scope

  def initialize(title, author, text, links, companions, scientific_scope)
    super(title, author, text, links)
    @companions = companions
    @scientific_scope = scientific_scope
  end
end
