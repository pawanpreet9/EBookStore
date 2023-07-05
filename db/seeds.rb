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
genres = []
20.times do
  genres = Genre.new(name: Faker::Book.unique.genre)
  if(genres.save)
    puts "successfully saved"

else
  puts "error"
end
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

 # genres = Genre.order('RANDOM()').limit(rand(1..3))
  #genres.each do |genre|
   # book.genres << genre
  #end

 # rand(1..3).times do
   # store = Store.order('RANDOM()').first
  #  book.stores << store
#  end
# Assign unique genres to the book
genre_ids = Genre.pluck(:id).sample(rand(1..3))
genres = Genre.where(id: genre_ids)
book.genres << genres

# Assign multiple stores to the book
store_ids = Store.pluck(:id).sample(rand(1..3))
stores = Store.where(id: store_ids)
book.stores << stores

  book.save
  book_count += 1
end

# Generate Reviews
Book.all.each do |book|
  rand(1..5).times do
    Review.create!(
      rating: rand(1..5),
      comment: Faker::Lorem.paragraph(sentence_count: 3),
      book: book
    )
  end
end