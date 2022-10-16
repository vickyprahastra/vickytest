require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test "visiting the index" do
    visit books_url
    assert_selector "h1", text: "Books"
  end

  test "creating a Book" do
    visit books_url
    click_on "New Book"

    fill_in "Author", with: @book.author
    fill_in "Author name", with: @book.author_name
    fill_in "Authors", with: @book.authors
    fill_in "Average rating", with: @book.average_rating
    fill_in "Category", with: @book.category
    fill_in "Classes", with: @book.classes
    check "Content available" if @book.content_available
    check "Content cleaned" if @book.content_cleaned
    fill_in "Content name", with: @book.content_name
    fill_in "Copyright", with: @book.copyright
    fill_in "Countries", with: @book.countries
    fill_in "Cover", with: @book.cover
    fill_in "Description", with: @book.description
    fill_in "Genres", with: @book.genres
    fill_in "Goodreads", with: @book.goodreads
    fill_in "Gutenberg", with: @book.gutenberg
    fill_in "Images", with: @book.images
    fill_in "Images urls", with: @book.images_urls
    fill_in "Int", with: @book.int_id
    fill_in "Language", with: @book.language
    fill_in "Loc class", with: @book.loc_class
    fill_in "N authors", with: @book.n_authors
    fill_in "Release date", with: @book.release_date
    fill_in "Similar books", with: @book.similar_books
    fill_in "Title", with: @book.title
    fill_in "Wikipedia", with: @book.wikipedia
    fill_in "Year", with: @book.year
    click_on "Create Book"

    assert_text "Book was successfully created"
    click_on "Back"
  end

  test "updating a Book" do
    visit books_url
    click_on "Edit", match: :first

    fill_in "Author", with: @book.author
    fill_in "Author name", with: @book.author_name
    fill_in "Authors", with: @book.authors
    fill_in "Average rating", with: @book.average_rating
    fill_in "Category", with: @book.category
    fill_in "Classes", with: @book.classes
    check "Content available" if @book.content_available
    check "Content cleaned" if @book.content_cleaned
    fill_in "Content name", with: @book.content_name
    fill_in "Copyright", with: @book.copyright
    fill_in "Countries", with: @book.countries
    fill_in "Cover", with: @book.cover
    fill_in "Description", with: @book.description
    fill_in "Genres", with: @book.genres
    fill_in "Goodreads", with: @book.goodreads
    fill_in "Gutenberg", with: @book.gutenberg
    fill_in "Images", with: @book.images
    fill_in "Images urls", with: @book.images_urls
    fill_in "Int", with: @book.int_id
    fill_in "Language", with: @book.language
    fill_in "Loc class", with: @book.loc_class
    fill_in "N authors", with: @book.n_authors
    fill_in "Release date", with: @book.release_date
    fill_in "Similar books", with: @book.similar_books
    fill_in "Title", with: @book.title
    fill_in "Wikipedia", with: @book.wikipedia
    fill_in "Year", with: @book.year
    click_on "Update Book"

    assert_text "Book was successfully updated"
    click_on "Back"
  end

  test "destroying a Book" do
    visit books_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Book was successfully destroyed"
  end
end
