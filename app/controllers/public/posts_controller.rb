class Public::PostsController < ApplicationController
    
  def new
    @post = Post.new
    @cleaning_tool = @post.cleaning_tools.build
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
    @post_comment = Comment.new
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
    if params[:category] then
      @posts = Post.category.where(name: params[:category])
    elsif params[:keyword].present? then
      @posts = Post.where("title LIKE ?", "%#{params[:keyword]}%").where("introduction LIKE ?", "%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @posts = Post.page(params[:page]).per(9)
    end
  end
  
  private
  def post_params
    params.require(:post).permit( 
      :title,:post_image,:introduction,:category_name,:recipe_image,:cleaning_recipe,:cleaning_tool,
      { :category_ids=> [] },
      cleaning_tools_attributes:[:id, :post_id, :cleaning_tool_name, :_destroy],
      cleaning_recipes_attributes:[:id, :post_id, :cleaning_recipe, :recipe_image, :_destroy])
     
  end
end
