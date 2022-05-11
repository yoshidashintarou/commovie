class Public::UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to public_users_path
    else
      render edit_public_users_path
    end
  end


end

private
def user_params
  params.require(:user).permit(:name, :email, :image)
end
