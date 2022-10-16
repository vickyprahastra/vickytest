class Book < ApplicationRecord
  after_save :parse_json
  jsonb_accessor :wikipedia,
    url: :string,
    found: :boolean

  def parse_json
    update_columns(authors: JSON.parse(self.authors))
  end
end
