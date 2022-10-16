require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:one)
  end

  test "should get index" do
    get authors_url
    assert_response :success
  end

  test "should get new" do
    get new_author_url
    assert_response :success
  end

  test "should create author" do
    assert_difference('Author.count') do
      post authors_url, params: { author: { books: @author.books, born: @author.born, countries: @author.countries, died: @author.died, gender: @author.gender, int_id: @author.int_id, n_books: @author.n_books, name: @author.name, summary: @author.summary, wikipedia: @author.wikipedia } }
    end

    assert_redirected_to author_url(Author.last)
  end

  test "should show author" do
    get author_url(@author)
    assert_response :success
  end

  test "should get edit" do
    get edit_author_url(@author)
    assert_response :success
  end

  test "should update author" do
    patch author_url(@author), params: { author: { books: @author.books, born: @author.born, countries: @author.countries, died: @author.died, gender: @author.gender, int_id: @author.int_id, n_books: @author.n_books, name: @author.name, summary: @author.summary, wikipedia: @author.wikipedia } }
    assert_redirected_to author_url(@author)
  end

  test "should destroy author" do
    assert_difference('Author.count', -1) do
      delete author_url(@author)
    end

    assert_redirected_to authors_url
  end
end
