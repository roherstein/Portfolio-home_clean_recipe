# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  
  before_action :user_status, only: [:create]
  
  def new_guest #ゲストログインのためのメソッド
    user = User.guest
    sign_in user
    redirect_to root_path
  end
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

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  def user_status
    @user = User.find_by(email: params[:user][:email])
    return if !@user
    if @user.is_deleted == true
      flash[:notice] = "退会済みのアカウントです。お手数ですが、再度ご登録の上ご利用ください。"
      redirect_to new_user_registration_path
    end
  end
end
