# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'
require 'faker'

# Seed Authors
author_count = Author.count
CSV.foreach(Rails.root.join('db', 'authors.csv'), headers: true) do |row|
  break if author_count >= 200
  Author.create(name: row['author_name'], author_id: row['author_id'])
  author_count += 1
end

# Seed Genres
50.times do
  Genre.create(name: Faker::Book.genre)
end

# Seed Stores
50.times do
  Store.create(name: Faker::Company.name, location: Faker::Address.full_address , city: Faker::Address.city)
end

# Seed Books
book_count = Book.count
CSV.foreach(Rails.root.join('db', 'books.csv'), headers: true) do |row|
  break if book_count >= 200
  author = Author.order("RANDOM()").first
  book = Book.new(
    title: row['title'],
    published_date: row['publication_date'],
    isbn: row['isbn'],
    average_rating: row['average_rating'],
    author_id: author.id,
    language: row['language_code'],
    pages: row['num_pages'],
    publisher: row['publisher']
  )

  rand(1..3).times do
    genre = Genre.order('RANDOM()').first
    book.genres << genre
  end

  rand(1..3).times do
    store = Store.order('RANDOM()').first
    book.stores << store
  end

  book.save
  book_count += 1
end
