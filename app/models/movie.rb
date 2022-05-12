class Movie < ApplicationRecord

  def index
    @movies = Movie.all
  end

  def show
  end

  def edit
    @movie = current_user
  end

end

private
def movie_params
  params.require(:movie).permit(:title, :body)
end

