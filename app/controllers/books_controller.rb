class BooksController < ApplicationController
	def show
    	@book = Book.find(params[:id])
    	@new_book = Book.new
      @user = User.find(current_user.id)
	end

	def index
    	@books = Book.all
    	@book = Book.new
      @user = User.find(current_user.id)
  end

  def edit
      @book = Book.find(params[:id])
 	end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have creatad book successfully."
    else
      @books = Book.all
      @user = User.find(current_user.id)
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated user successfully."
    else
      @books = Book.all
      render :edit
    end
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

  private
  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to users_path
    end
  end
end
