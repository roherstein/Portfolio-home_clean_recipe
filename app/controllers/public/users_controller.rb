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
    @user.update(user_params)
    redirect_to user_path
  end
  
  def show
    @user = User.find(params[:id])
  end
  
end
