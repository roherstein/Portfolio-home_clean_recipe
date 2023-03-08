class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザ情報を更新しました"
      redirect_to admin_users_path
    else
      flash[:notice] = "ユーザ情報の更新に失敗しました"
      redirect_to edit_admin_user_path
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:is_deleted)
  end
end
