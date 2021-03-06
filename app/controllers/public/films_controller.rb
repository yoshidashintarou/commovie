class Public::FilmsController < ApplicationController

  def index
    @films = Film.page(params[:page]).per(8)
  end

  def show
    @film = Film.find(params[:id])
    @films = Film.page(params[:page]).per(8)
  end

  def edit
    @film = Film.find(params[:id])
    @films = Film.page(params[:page]).per(8)
  end

  def create
    @film = Film.new(film_params)
    @film.user = current_user
    if @film.save
     redirect_to public_films_path(@film)
    else
     flash[:notice] = "空白だと投稿できません"
     render :new
    end
  end


  def new
    @film = Film.new
  end

   def destroy
    film = Film.find(params[:id])
    film.destroy
    redirect_to public_film_path
   end

end

private
 def film_params
  params.require(:film).permit(:title, :body,)
 end






