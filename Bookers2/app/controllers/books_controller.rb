class BooksController < ApplicationController

before_action :authenticate_user!

   def index
    @books = Book.all
    @book = Book.new
    @user = current_user

   end

  def show
    @book= Book.find(params[:id])
    @user = User.find_by(id: @book.user_id)
   #@user = @book.user
  end

  def new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id=current_user.id
    @user = current_user

    if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)

    else
    @books = Book.all
    render "index"

    end
  end



  def edit
  @book = Book.find(params[:id])
  if @book.user == current_user
   render "edit"
  else
   redirect_to  books_path
  end
  end



  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book)
    else
    render :edit
    end
  end

  def destroy
  book = Book.find(params[:id])
   book.destroy
    flash[:notice] = "Book was successfully destroyed."
  redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
