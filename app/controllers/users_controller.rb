class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top,:about]
  def index
    @user = current_user
    @users = User.all.order(created_at: :desc)
    @book = Book.new
  end
  def show
    @user = User.find(params[:id]) 
    @books = @user.books.reverse_order
     @book=Book.new
     
  end
  
  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      flash[:notice] = "You can't access this page successfully!"
      redirect_to user_path(current_user.id)
    end
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "updated_inttroduction successfully !"
      redirect_to user_path(@user.id)
    else
       flash[:notice] = "error......unsuccessfully updated user!sorryyyy!!!!"
      render :edit
    end
  end
  def top
  end
  def about
  end
  private 
def user_params
    params.require(:user).permit(:name, :profile_image)
end
end
