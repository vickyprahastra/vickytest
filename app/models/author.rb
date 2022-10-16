class Author < ApplicationRecord
  enum gender: { n: 0, m: 1, f: 2 }
  after_save :parse_json
  jsonb_accessor :wikipedia,
    url: :string,
    found: :boolean

  def parse_json
    books = JSON.parse(self.books)
    update_columns(books: books)
  end
end
