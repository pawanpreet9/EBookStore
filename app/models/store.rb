class Store < ApplicationRecord
  has_many :book_stores
  has_many :books, through: :book_stores

  validates :name, presence: true
  validates :location, length: { maximum: 500 }

end
