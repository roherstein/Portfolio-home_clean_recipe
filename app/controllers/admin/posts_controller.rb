class Admin::PostsController < ApplicationController
  def index
    posts = Post.where(is_publish: true)
    @posts = Kaminari.paginate_array(posts).page(params[:page]).per(20)
  end
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end
end
