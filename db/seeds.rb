# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

json_data = JSON.parse(File.read(Rails.root.join('db/books.json')))
json_data['books'].each_with_index do |item, index|
  book = Book.find_by(int_id: item['id'])
  next if book.present?

  Book.create(
    content_name:       item['content_name'],
    author_name:        item['author_name'],
    images_urls:        item['images_urls'],
    year:               item['year'],
    images:             item['images'],
    int_id:             item['id'],
    category:           item['category'],
    genres:             item['genres'],
    copyright:          item['copyright'],
    title:              item['title'],
    wikipedia:          item['wikipedia'],
    average_rating:     item['average_rating'],
    goodreads:          item['goodreads'],
    similar_books:      item['similar_books'],
    description:        item['description'],
    loc_class:          item['loc_class'],
    gutenberg:          item['gutenberg'],
    authors:            item['authors'],
    language:           item['language'],
    countries:          item['countries'],
    release_date:       item['release_date'],
    author:             item['author'],
    cover:              item['cover'],
    content_cleaned:    item['content_cleaned'],
    classes:            item['classes'],
    content_available:  item['content_available'],
    n_authors:          item['n_authors']
  )

  # break if index >= 99
end

json_data_authors = JSON.parse(File.read(Rails.root.join('db/authors.json')))
json_data_authors['authors'].each_with_index do |item, index|
  author = Author.find_by(int_id: item['id'])
  next if author.present?

  Author.create(
    name:       item['name'],
    countries:  item['countries'],
    gender:     item['gender'],
    wikipedia:  item['wikipedia'],
    n_books:    item['n_books'],
    summary:    item['summary'],
    born:       item['born'],
    books:      item['books'],
    int_id:     item['id'],
    died:       item['died']
  )

  # break if index >= 99
end

puts "Total books:    #{Book.all.count}"
puts "Total authors:  #{Author.all.count}"
