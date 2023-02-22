class Public::PostsController < ApplicationController
    
  def new
    @post = Post.new
  end
  
  def index
    @posts = Post.page(params[:page]).per(9)
  end
  
  private
  def post_params
    params.require(:post).permit(:title,:post_image,)
  end
end
