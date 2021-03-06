class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit, :unsubscribe]


  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to public_user_path
    else
      render edit_public_user_path
    end
  end

  def index
  end

  def filmfavorites
    @user = User.find(params[:id])
    filmfavorites = FilmFavorite.where(user_id: @user.id).pluck(:film_id)
    @filmfavorites_fims = Film.find(filmfavorites)
  end




 def withdrawal
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
 end

 def unsubscribe
   @user = current_user
 end

end

private
  def user_params
    params.require(:user).permit(:name, :email, :image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to public_user_path(current_user), notice: 'ゲストユーザーはこの機能を使用することは出来ません。'
    end
  end

 def film_params
  params.require(:film).permit(:title, :body,)
 end



