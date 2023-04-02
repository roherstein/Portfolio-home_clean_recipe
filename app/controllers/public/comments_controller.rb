class Public::CommentsController < ApplicationController
    
  def index
    comments = Post.where(current_user_id: current_user.id).pluck(:post_id)
    @commnet_posts = Post.find(comments)
  end
  
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    if  @comment.save
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post), notice: "error"
    end
  end
  
  def destroy
    # Comment.find(params[:id]).destroy
    # redirect_to post_path(params[:post_id])
    # byebug
    post = Post.find(params[:id])
    comment = current_user.comments.find_by(post_id: post.id)
    comment.destroy
    redirect_to post_path(post)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment) 
  end
  
end
