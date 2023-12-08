class Publication
  attr_accessor :title, :author, :text, :links
  def initialize(title, author, text, links)
    @title = title
    @author = author
    @text = text
    @links = links
  end
end
