class Admin::PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page])
  end
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comment = Comment.new
  end
end
