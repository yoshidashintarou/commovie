class Admin::CustomersController < ApplicationController
  def index
   @customers = Movie.page(params[:page]).per(15)
   @customers = Film.page(params[:page]).per(15)
   @customers = User.page(params[:page]).per(15)
  end

  def show
    
  end

  def edit
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :body)
  end

  def film_params
    params.require(:film).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :email, :image, :is_deleted)
  end

end
