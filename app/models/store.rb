class Store < ApplicationRecord
  has_many :book_stores
  has_many :books, through: :book_stores

end
