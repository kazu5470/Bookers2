class BooksController < ApplicationController
  
  def create
    @book = current_user.book.new(params.permit(:title, :body))
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.includes(:user).page(params[:page]).per(5)
      render :index
    end
  end
  
  
  def edit
    @book = Book.find(params[:id])
    redirect_to books_path if @book.user_id != current_user.id
  end

  def index
    @book ||= Book.new
    @books = Book.includes(:user).page(params[:page]).per(5)
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user    
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(params.require(:book).permit(:title, :body, :image))
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit  
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end  
  
end