# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'
require 'faker'

# Authors
CSV.foreach(Rails.root.join('db', 'author.csv'), headers: true) do |row|
  Author.create(name: row['name'])
end

# Genres
50.times do
  Genre.create(name: Faker::Book.genre)
end

# Stores
50.times do
  Store.create(name: Faker::Company.name, location: Faker::Address.full_address)
end

# Seed Books
CSV.foreach(Rails.root.join('db', 'book.csv'), headers: true) do |row|
  author = Author.order("RANDOM()").first
  book = Book.new(
    title: row['title'],
    published_date: row['publication_date'],
    isbn: row['isbn'],
    average_rating: row['average_rating'],
    author: author
  )
  rand(1..3).times do
    genre = Genre.order('RANDOM()').first
    book.genres << genre
  end
  book.save
end
