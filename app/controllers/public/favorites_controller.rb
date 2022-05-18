class Public::FavoritesController < ApplicationController
  def create
  @movie_favorite = Favorite.new(user_id: current_user.id, movie_id: params[:movie_id])
  @movie_favorite.save
  end

  def destroy
  @movie_favorite = Favorite.find_by(user_id: current_user.id, movie_id: params[:movie_id])
  @movie_favorite.destroy
  end
end
