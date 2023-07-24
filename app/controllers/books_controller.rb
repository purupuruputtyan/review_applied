class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def create
    @book = Book.new
    if @book.save(book_params)
      redirect_to books_path
      flash[:notice] = "投稿に成功しました。"
    else
      @books = Book.all
      render books_path
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find
  end

  def update

  end

  def destroy

  end

  private

  def book_params
    params.require(:book).premit(:title, :body , :image)
  end
end
