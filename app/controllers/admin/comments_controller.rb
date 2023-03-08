class Admin::CommentsController < ApplicationController
  def index
    @comments = Comment.page(params[:page])
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "コメントを削除しました"
      redirect_to post_comments
    else
      flash[:notice] = "コメントの削除に失敗しました"
      redirect_to admin_comment_path(@commnet)
    end
  end
end
