class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  
  def mypage
    @user = User.find(current_user.id)
    @posts = @user.posts.where(is_publish: true).order(created_at: :desc).limit(10)
    @draft_posts = @user.posts.where(is_publish: false).order(created_at: :desc).limit(10)
  end
  
  def edit
    @user = User.find(current_user.id)
  end
  
  def update
    @user = current_user
    if @user.email == "guest@example.com"
      redirect_to edit_user_path(@user), alert: 'ゲストユーザのため、変更・削除はできません。'
    else
      if @user.update(user_params)
        flash[:notice] = 'ユーザ情報を編集しました。'
        redirect_to user_path
      else
        flash.now[:notice] = 'ユーザ情報の編集に失敗しました。'
        render :edit
      end
    end
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.where(is_publish: true).order(created_at: :desc).limit(10)
  end
  
  def confirm
    @user = User.find(current_user.id)
    if @user.email == "guest@example.com"
      redirect_to edit_user_path(@user), alert: 'ゲストユーザの変更・削除はできません。'
    end
  end
  
  def withdrawal
    #byebug
    @user = current_user
    #@user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = '退会処理を実行いたしました'
    redirect_to root_path
  end
  
  def post_list
    @user = User.find(params[:id])
    posts = Post.where(user_id: params[:id]).where(is_publish: true).pluck(:id)
    @posts = Kaminari.paginate_array(Post.find(posts)).page(params[:page])
  end
  

  private
  def user_params
    params.require(:user).permit(:email,:user_name,:profile_image,:self_introduction,:is_deleted)
  end
  
end
