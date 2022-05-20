class Public::FavoritesController < ApplicationController
  def create
    favorite = Favorite.new(user_id: current_user.id, movie_id: params[:movie_id])
    favorite.save
    @movie = Movie.find(params[:movie_id])
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, movie_id: params[:movie_id])
    favorite.destroy
    @movie = Movie.find(params[:movie_id])
  end

end
