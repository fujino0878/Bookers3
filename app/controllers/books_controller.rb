class BooksController < ApplicationController
  before_action :authenticate_user!,only: [:create,:edit,:update,:destroy,:index,:show]
    def create
        @book = Book.new(book_params)
  	@book.user_id = current_user.id
    	if @book.save
  		flash[:notice] = "You created book successfully !!!!!"
     	redirect_to book_path(id: @book.id)
        else
      @user = current_user
      @books = Book.all.reverse_order
      flash[:notice] = "error !!!!!"
      render :index
        end
    
    end
    def update
    @user = current_user
  	@book = Book.find(params[:id])
  	@book.user_id = current_user.id
  	
  	#ログインのチェック！！！！！
  if @book.user_id != current_user.id
      flash[:notice] = " error! You can't access!"
      redirect_to books_path
  
  end
  
  #アップデート！！！
   	if @book.update(book_params)
  		flash[:notice] = "successfully edited!"
  		redirect_to book_path(@book.id)
  	else
  	  	flash[:notice] = "error error not successfully edited!"
  		render :edit
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
      flash[:notice] = " error! You can't access!"
      redirect_to books_path
    end
    end
    def show
   
    @booka = Book.find(params[:id])
    @user = User.find (@booka.user_id)
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
