class Book < ApplicationRecord
  has_many :book_stores
  has_and_belongs_to_many :stores

  has_and_belongs_to_many :genres
  belongs_to :author
  has_many :reviews

  def self.search(query, genre_id)

    books = all

    if query.present?
      books = books.where('title LIKE ?', "%#{query}%")
    end

    if genre_id.present?
      books = books.joins(:genre).where(genres: { id: genre_id })
    end

    books
  end


  #Validations.
  validates :title, presence: true, uniqueness: true,length: { maximum: 1000 }
  validates :published_date, presence: true
  validates :isbn, presence: true
  validates :average_rating, presence: true

end
