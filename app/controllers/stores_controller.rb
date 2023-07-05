class StoresController < ApplicationController
  def show
    @store = Store.find(params[:id])
    @books = @store.books
  end
end
