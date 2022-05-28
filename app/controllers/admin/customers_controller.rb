class Admin::CustomersController < ApplicationController
  def index
   @customers = Movie.page(params[:page]).per(15)
   @customers = Film.page(params[:page]).per(15)
   @customers = User.page(params[:page]).per(15)
  end

  def show
    @movies = Movie.page(params[:page]).per(5)
    @films = Film.page(params[:page]).per(5)
    @movie = Movie.find(params[:id])
    @film = Film.find(params[:id])
    @user = User.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
    @film = Film.find(params[:id])
    @user = User.find(params[:id])

  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to public_user_path
    else
      render edit_public_user_path
    end
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