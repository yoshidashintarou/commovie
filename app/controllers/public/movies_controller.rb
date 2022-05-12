class Public::MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show

  end

  def edit
    @movie = current_user
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
   redirect_to public_movies_path(@movie)
  end


  def new
    @movie = Movie.new
  end

end

private
 def movie_params
   params.permit(:title, :body)
 end


