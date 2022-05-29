class Public::CommentsController < ApplicationController

  def create
    film = Film.find(params[:film_id])
    comment = current_user.comments.new(comment_params)
    comment.film_id = film.id
    if comment.save
     redirect_to public_films_path(film)
    else
     flash[:notice] = "空白だとコメントできません"
     redirect_to  edit_public_film_path(film)
    end
  end


  def destroy
   @comment = Comment.find(params[:id])
   @comment.destroy
    if current_admin
      redirect_to admin_customer_path(current_admin.id)
    else
      redirect_to public_film_path(params[:film_id])
    end
  end
end

 private
  def comment_params
    params.require(:comment).permit(:comment)
  end
