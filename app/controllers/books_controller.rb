class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "投稿に成功しました。"
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
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
    params.require(:book).permit(:title, :body, :image)
  end
end
