class Author < ApplicationRecord
  enum gender: { n: 0, m: 1, f: 2 }
end
