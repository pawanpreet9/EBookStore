class BooksController < ApplicationController
  def menu
    @books = Book.includes(:author, :genres)
  end
end
