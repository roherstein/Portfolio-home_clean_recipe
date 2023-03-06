class Public::UsersController < ApplicationController
  
  
  def mypage
    @user = User.find(current_user.id)
    @posts = @user.posts.where(is_publish: true)
    @draft_posts = @user.posts.where(is_publish: false)
  end
  
  def edit
    @user = User.find(current_user.id)
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = 'ユーザ情報を編集しました'
      redirect_to user_path(@user)
    else
      flash[:notice] = 'ユーザ情報の編集に失敗しました'
      redirect_to edit_user_path
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  private
  def user_params
    params.require(:user).permit(:email,:user_name,:self_introduction,:is_deleted)
  end
  
end
