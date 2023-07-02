class Book < ApplicationRecord
  has_many :book_stores
  has_and_belongs_to_many :stores

  has_and_belongs_to_many :genres
  belongs_to :author

  #Validations.
  validates :title, presence: true, uniqueness: true,length: { maximum: 1000 }
  validates :published_date, presence: true
  validates :isbn, presence: true
  validates :average_rating, presence: true

end
