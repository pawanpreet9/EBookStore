class Store < ApplicationRecord
  has_many :book_stores
  has_many :books, through: :book_stores
  has_and_belongs_to_many :books

  validates :name, presence: true
  validates :location, length: { maximum: 500 }

end
