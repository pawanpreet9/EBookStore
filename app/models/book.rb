class Book < ApplicationRecord
  has_many :book_stores
  has_many :stores, through: :book_stores

  has_and_belongs_to_many :genres
  belongs_to :author
end
