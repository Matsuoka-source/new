class BooksController < ApplicationController
 def index
   @books = Book.all
   @book = Book.new
 end

 def top
 end

 def show
  @book = Book.find(params[:id])
 end


 def create
  @books = Book.all
  @book = Book.new(book_params)
  if @book.save
   flash[:notice] = 'successfully'
   redirect_to book_path(@book)
  else
   flash.now[:danger] = 'メッセージを入力してください。'
   render :index
  end


 end


 def edit
  @book = Book.find(params[:id])
 end

 def update
  @books = Book.all


  @book = Book.find(params[:id])
  #redirect_to book_path(book)
  if @book.update(book_params)
   flash[:notice] = 'successfully'
   redirect_to book_path
  else
   flash.now[:danger] = 'メッセージを入力してください。'
   render :edit
  end
 end

 def destroy
  @book = Book.find(params[:id])
    if @book.destroy
     redirect_to books_path
    else
     render :edit
    end
 end

 private
 def book_params
  params.require(:book).permit(:title, :body)
 end
end
