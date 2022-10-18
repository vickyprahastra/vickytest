class Book < ApplicationRecord
  jsonb_accessor :wikipedia,
    url: :string,
    found: :boolean
end
