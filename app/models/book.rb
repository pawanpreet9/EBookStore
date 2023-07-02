class Book < ApplicationRecord
  has_and_belongs_to_many :stores
  has_and_belongs_to_many :genres
  belongs_to :author
end
