require 'test/unit'

require_relative 'library'

class LibraryTest < Test::Unit::TestCase
  def test_add_publication
    science_pub = SciencePublication.new("Scientific", "Scientist", "Text", [], ["Scientist2"], "Software development")
    library = Library.new([])
    library.add_publication(science_pub)
    assert_equal(library.publications, [science_pub])
    library.add_publication(science_pub)
    assert_equal(library.publications, [science_pub])
  end

  def test_get_linked_publications
    pub1 = SciencePublication.new("Scientific 1", "Scientist", "Text", [], ["Scientist2"], "Software development")
    pub2 = SciencePublication.new("Scientific 2", "Scientist", "Text", [pub1], ["Scientist2"], "Software development")
    library = Library.new([pub1, pub2])
    assert_equal(library.get_linked_publications(pub2), [pub1])
    assert_equal(library.get_linked_publications(pub1), [])
  end

  def test_get_publication_by_title
    science_pub = SciencePublication.new("Scientific", "Scientist", "Text", [], ["Scientist2"], "Software development")
    library = Library.new([science_pub])
    assert_equal(library.get_publication_by_title("Scientific"), science_pub)
    assert_equal(library.get_publication_by_title("scientific"), science_pub)
    assert_equal(library.get_publication_by_title("science"), nil)
  end

  def test_get_publications_by_author
    pub1 = SciencePublication.new("Scientific 1", "Scientist", "Text", [], ["Scientist2"], "Software development")
    pub2 = SciencePublication.new("Scientific 2", "Scientist", "Text", [pub1], ["Scientist2"], "Software development")
    pub3 = SciencePublication.new("Scientific 1", "Scientist2", "Text", [], ["Scientist2"], "Software development")
    library = Library.new([pub1, pub2, pub3])
    assert_equal(library.get_publications_by_author("Scientist"), [pub1, pub2])
  end

  def test_get_publications_by_keywords
    pub1 = SciencePublication.new("Scientific 1", "Scientist", "Text", [], ["Scientist2"], "Software development")
    pub2 = SciencePublication.new("Scientific 1", "Scientist", "Text1", [], ["Scientist2"], "Software development")
    library = Library.new([pub1, pub2])
    assert_equal(library.get_publications_by_keywords(%w[Some Text]), [pub1])
  end

  def test_sort_publications_by_input
    pub1 = SciencePublication.new("A", "Scientist", "Text", [], ["Scientist2"], "Software development")
    pub2 = SciencePublication.new("BC", "Scientist", "Text1", [], ["Scientist2"], "Software development")
    library = Library.new([pub1, pub2])
    assert_equal(library.sort_publications_by_input("A"), [pub1, pub2])

    pub1 = SciencePublication.new("AB", "Scientist", "Text", [], ["Scientist2"], "Software development")
    pub2 = SciencePublication.new("A", "Scientist", "Text1", [], ["Scientist2"], "Software development")
    library = Library.new([pub1, pub2])
    assert_equal(library.sort_publications_by_input("A"), [pub2, pub1])
  end

end