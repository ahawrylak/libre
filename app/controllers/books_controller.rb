class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book added!"
      redirect_to book_path(@book)
    else
      flash[:alert] = "Couldn't add book! Try again."
      redirect_to :back
    end
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:notice] = "Book deleted"
    redirect_to books_path
  end

  def index
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:notice] = "Successfully updated!"
      redirect_to book_path(@book)
    else
      flash[:alert] = "Couldn't update"
      redirect_to :back
    end
  end

  def show
    @book = Book.find_by(id: params[:id])
    redirect_to books_path unless @book
    @review = Review.new(book: @book) # to use in review_form
    @rating = Rating.new(book: @book) # to use in rating_form
  end

  private

    def book_params
      params.require(:book).permit(:author, :title, :pub_year, :description)
    end

end
