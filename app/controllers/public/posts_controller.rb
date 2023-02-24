class Public::PostsController < ApplicationController
    
  def new
    @post = Post.new
    @cleaning_recipe = @post.cleaning_recipes.build
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  def index
    @posts = Post.page(params[:page]).per(9)
  end
  
  private
  def post_params
    params.require(:post).permit(
      {images: []},:title,:post_image,:introduction,:category_name,:cleaning_tool_name,:recipe_image,:cleaning_recipe,
      cleaning_recipes_attributes:[:id, :cleaning_recipe_id, :_destroy])
      .merge(user_id: current_user.id)
  end
end
