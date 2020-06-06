class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]



  
 def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      @books = Book.all
      @user = current_user
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      render "index"
    end
  end



  def index
      @books = Book.all
      @book = Book.new
      @users = User.all
  end


  def show
      @book = Book.find(params[:id])
      @book_new = Book.new
      @user = @book.user
      #User.find(@book.user_id)
  end


  def edit
      @book = Book.find(params[:id])
  end


  def update
      @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      render "edit"
    end
  end


  def destroy
      @book = Book.find(params[:id])


      book = current_user
      book.destroy
      redirect_to book_path(@book.id)
  end





  private


  def book_params
      params.require(:book).permit(:title, :body, :introduction, )
  end


  def correct_user
    @book = Book.find(params[:id])
    redirect_to(books_path) unless @book.user.id == current_user.id
    end

end
