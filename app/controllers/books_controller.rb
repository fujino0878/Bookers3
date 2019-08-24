class BooksController < ApplicationController
  
    def create
        @book = Book.new(book_params)
  	@book.user_id = current_user.id
    	if @book.save
  		flash[:notice] = "You created book successfully !!!!!"
     	redirect_to book_path(id: @book.id)
        else
      @user = current_user
      @books = Book.all.reverse_order
      render :index
        end
    
    end
    def index
        @user = current_user
        @book=Book.new
        @books=Book.all.reverse_order
    end
    def edit
        @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      flash[:notice] = " You can't access!"
      redirect_to user_path(@book.user_id)
    end
    end
    def show
    @booka = Book.find(params[:id])
    @user = current_user
    @book= Book.new
    end
    
     def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice]="Book has successfully deleted!"
    redirect_to books_path
     end

    private
    def book_params
      params.require(:book).permit(:title,:body)
    end
 
end
