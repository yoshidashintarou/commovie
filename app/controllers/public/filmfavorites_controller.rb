class Public::FilmfavoritesController < ApplicationController
  def create
    favorite = FilmFavorite.new(user_id: current_user.id, film_id: params[:film_id])
    favorite.save
    @film = Film.find(params[:film_id])
    # render 'public/filmfavorites/create.js.erb'
  end




  def destroy
    favorite = FilmFavorite.find_by(user_id: current_user.id, film_id: params[:film_id])
    favorite.destroy
    @film = Film.find(params[:film_id])
  end
end
