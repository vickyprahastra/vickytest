class Book < ApplicationRecord
  after_save :parse_json
  after_create :create_id

  def create_id
    update_columns(int_id: Author.count + 1)
  end

  def parse_json
    return if authors.is_a? Array
    return unless authors

    authors = JSON.parse(self.authors)
    update_columns(authors: authors)
  end
end
