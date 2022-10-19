class Author < ApplicationRecord
  has_many :books
  enum gender: { n: 0, m: 1, f: 2 }

  after_save :parse_json
  after_create :create_id

  def parse_json
    return if books.is_a? Array
    return unless books

    books = JSON.parse(self.books)
    update_columns(books: books)
  end

  def create_id
    update_columns(int_id: Author.count + 1)
  end
end
