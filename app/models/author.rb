class Author < ApplicationRecord
  has_many :books
  validates :name, presence: true, uniqueness: true,length: { maximum: 100 }
end
