# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected
# 退会しているかを判断するメソッド
def user_state
  @user = User.find_by(email: params[:user][:email])
  return if !@user
  if @user.valid_password?(params[:user][:password])
   if @user.is_deleted == true
          redirect_to  new_user_registration_path
   end
  end
end

  def reject_user
      @user = User.find_by(name: params[:user][:name])
      if @user
        if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == false)
          flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
          redirect_to new_user_registration
        else
          flash[:notice] = "項目を入力してください"
        end
      end
  end
end