json.extract! book, :id, :content_name, :author_name, :images_urls, :year, :images, :int_id, :category, :genres, :copyright, :title, :wikipedia, :average_rating, :goodreads, :similar_books, :description, :loc_class, :gutenberg, :authors, :language, :countries, :release_date, :author, :cover, :content_cleaned, :classes, :content_available, :n_authors, :created_at, :updated_at
json.url book_url(book, format: :json)
