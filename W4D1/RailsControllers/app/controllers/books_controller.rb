class BooksController < ApplicationController
  def index
    @books = Book.all
    # render Books: @books
    render :index
  end

  def new
    # This is optional?
    render :new
  end

  def create
    Book.create!(book_params)
    redirect_to books_url
  end

  def destroy
    book = Book.find_by(id: params[:id])
    book.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
