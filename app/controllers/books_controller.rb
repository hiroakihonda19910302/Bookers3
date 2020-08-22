class BooksController < ApplicationController
	def show
    	@book = Book.find(params[:id])
    	@book = Book.new
      @user = User.find(current_user.id)
	end

	def index
    	@books = Book.all
    	@book = Book.new
      @user = User.find(current_user.id)
  end

  def edit
      @book = Book.new
 	end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have creatad book successfully."
    else
      @books = Book.all
      render action: :index
    end
  end

  def update
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
