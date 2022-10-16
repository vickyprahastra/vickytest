require "application_system_test_case"

class AuthorsTest < ApplicationSystemTestCase
  setup do
    @author = authors(:one)
  end

  test "visiting the index" do
    visit authors_url
    assert_selector "h1", text: "Authors"
  end

  test "creating a Author" do
    visit authors_url
    click_on "New Author"

    fill_in "Books", with: @author.books
    fill_in "Born", with: @author.born
    fill_in "Countries", with: @author.countries
    fill_in "Died", with: @author.died
    fill_in "Gender", with: @author.gender
    fill_in "Int", with: @author.int_id
    fill_in "N books", with: @author.n_books
    fill_in "Name", with: @author.name
    fill_in "Summary", with: @author.summary
    fill_in "Wikipedia", with: @author.wikipedia
    click_on "Create Author"

    assert_text "Author was successfully created"
    click_on "Back"
  end

  test "updating a Author" do
    visit authors_url
    click_on "Edit", match: :first

    fill_in "Books", with: @author.books
    fill_in "Born", with: @author.born
    fill_in "Countries", with: @author.countries
    fill_in "Died", with: @author.died
    fill_in "Gender", with: @author.gender
    fill_in "Int", with: @author.int_id
    fill_in "N books", with: @author.n_books
    fill_in "Name", with: @author.name
    fill_in "Summary", with: @author.summary
    fill_in "Wikipedia", with: @author.wikipedia
    click_on "Update Author"

    assert_text "Author was successfully updated"
    click_on "Back"
  end

  test "destroying a Author" do
    visit authors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Author was successfully destroyed"
  end
end
