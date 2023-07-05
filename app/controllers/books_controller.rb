class BooksController < ApplicationController
  def menu
    @books = Book.includes(:author, :genres).page(params[:page]).per(10)
  end

  def show
    @book = Book.find(params[:id])
  end
  def search
    query = params[:query]
    genre_id = params[:genre]

    books = Book.includes(:author, :genres)

    # Apply text search if query is present
    if query.present?
      @books = books.where('lower(title) LIKE ?', "%#{query.downcase}%").page(params[:page]).per(10)
    end

    # Apply genre filter if genre_id is present
    if genre_id.present?
      @books = books.joins(:genres).where(genres: { id: genre_id }).page(params[:page]).per(10)
    end




    render :search
  end

end
