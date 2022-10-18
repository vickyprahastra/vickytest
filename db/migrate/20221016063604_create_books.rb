class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books, id: :uuid do |t|
      t.string :content_name
      t.string :isbn
      t.string :original_title
      t.integer :year
      t.string :author_name
      t.jsonb :images_urls, default: []
      t.string :language_code
      t.jsonb :images, default: []
      t.integer :int_id
      t.string :category
      t.string :plot
      t.jsonb :genres, default: []
      t.string :copyright
      t.string :title
      t.jsonb :wikipedia, default: {}
      t.float :average_rating
      t.jsonb :goodreads, default: {}
      t.jsonb :similar_books, default: []
      t.string :description
      t.string :loc_class
      t.jsonb :gutenberg, default: {}
      t.jsonb :authors, default: []
      t.integer :pages, default: 0
      t.string :language
      t.string :isbn13
      t.jsonb :countries, default: []
      t.datetime :release_date
      t.integer :author
      t.string :cover
      t.string :summary
      t.boolean :content_cleaned, default: false
      t.jsonb :classes, default: []
      t.boolean :content_available, default: false
      t.integer :n_authors

      t.timestamps
    end
  end
end
