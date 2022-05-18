class Public::MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show

  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    if @movie.save
      redirect_to public_movies_path(@movie)
    else
      render :new
    end
  end


  def new
    @movie = Movie.new
  end

end

private
 def movie_params
   params.require(:movie).permit(:title, :body)
 end

