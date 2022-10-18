require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { author: @book.author, author_name: @book.author_name, authors: @book.authors, average_rating: @book.average_rating, category: @book.category, classes: @book.classes, content_available: @book.content_available, content_cleaned: @book.content_cleaned, content_name: @book.content_name, copyright: @book.copyright, countries: @book.countries, cover: @book.cover, description: @book.description, genres: @book.genres, goodreads: @book.goodreads, gutenberg: @book.gutenberg, images: @book.images, images_urls: @book.images_urls, int_id: @book.int_id, language: @book.language, loc_class: @book.loc_class, n_authors: @book.n_authors, release_date: @book.release_date, similar_books: @book.similar_books, title: @book.title, wikipedia: @book.wikipedia, year: @book.year } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(id: @book.id)
    end

    assert_redirected_to books_url
  end
end
