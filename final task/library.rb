require_relative 'journalist_publication'
require_relative 'science_publication'
require_relative 'term_paper_publication'

class Library
  attr_accessor :publications

  def initialize(publications)
    @publications = publications
  end

  def add_publication(publication)
    if publications.select { |arr_pub| arr_pub.title.casecmp(publication.title) == 0 }.any?
      return
    end
    publications.push(publication)
  end

  def get_linked_publications(publication)
    publication.links
  end

  def get_publication_by_title(title)
    publications.select { |publication| publication.title.casecmp(title) == 0 }.first
  end

  def get_publications_by_author(author)
    publications.select { |publication| publication.author.casecmp(author) == 0 }
  end

  def get_publications_by_keywords(keywords)
    publications.select do |publication|
      keywords.select do |keyword|
        publication.text.downcase.include?(keyword.downcase)
      end.length == keywords.length
    end
  end

  def sort_publications_by_input(input)
    publications.sort do |pub1, pub2|
      (pub1.title.casecmp input).abs - (pub2.title.casecmp input).abs
    end
  end
end
