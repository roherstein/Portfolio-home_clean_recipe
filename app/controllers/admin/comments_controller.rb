class Admin::CommentsController < ApplicationController
  def index
    @comments = Comment.page(params[:page])
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_comments
  end
end
