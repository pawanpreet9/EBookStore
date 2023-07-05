class StoresController < ApplicationController
  def index
    @stores = Store.all.page(params[:page]).per(10)
  end

  def show
    @store = Store.find(params[:id])
    @books = @store.books
  end
end
