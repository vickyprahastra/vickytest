class Book < ApplicationRecord
  after_save :parse_json
  jsonb_accessor :wikipedia,
    url: :string,
    found: :boolean

  def parse_json
    return unless self.authors

    update_columns(authors: JSON.parse(self.authors))
  end
end
