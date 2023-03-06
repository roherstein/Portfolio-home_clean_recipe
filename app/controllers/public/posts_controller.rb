class Public::PostsController < ApplicationController
    
  def new
    @post = Post.new
    @cleaning_tool = @post.cleaning_tools.build
    @cleaning_recipe = @post.cleaning_recipes.build
  end
  
  def create
    @post = current_user.posts.build(post_params)
    @post.is_publish = false if draft?
    if @post.is_publish?
      valid = @post.valid?(:publicize)
    else
      valid = @post.valid?
    end
    if valid
      @post.save!
      flash[:notice] = (draft? ? "下書き保存しました！" : "投稿が完了しました！")
      redirect_to post_path(@post)
    else
      flash.now[:notice] = (draft? ? "保存ができませんでした。" : "投稿できませんでした。") + "お手数ですが、入力内容をご確認の上、再度お試しください。"
      render :new
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comment = Comment.new
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.is_publish = true if change_publish?
    if @post.is_publish?
      valid = @post.valid?(:publicize)
    else
      valid = @post.valid?
    end
    if valid
      @post.update!(post_params)
      flash[:notice] = update_message_success
      redirect_to post_path(@post)
    else
      flash.now[:notice] = update_message_faild
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  def index
    if params[:category_id] then
      post_ids = PostCategory.where(category_id: params[:category_id]).pluck(:post_id)
      @posts = Kaminari.paginate_array(Post.find(post_ids)).page(params[:page])
    else
      @posts = Post.page(params[:page])
    end
  end
  
  def my_likes
    likes = Like.where(user_id: current_user.id).pluck(:post_id)
    @like_posts = Post.find(likes)
  end
  
  def my_comments
    comments = Comment.where(user_id: current_user.id).pluck(:post_id)
    @comment_posts = Post.find(comments)
  end
  
  private
  def post_params
    params.require(:post).permit( 
      :title,
      :post_image,
      :introduction,
      :is_publish,
      { :category_ids=> [] },
      cleaning_tools_attributes:[:id, :post_id, :cleaning_tool_name, :_destroy],
      cleaning_recipes_attributes:[:id, :post_id, :cleaning_recipe, :recipe_image, :_destroy])
  end
  
  def draft?
    params.keys.include?('draft_post')
  end
  
  def change_publish?
    params.keys.include?('change_publish')
  end
  
  def update_message_success
    keys = params.keys
    if keys.include?('update_draft')
      "下書きを更新しました！"
    elsif keys.include?('change_publish')
      "下書きのレシピを投稿しました！"
    elsif keys.include?('update_post')
      "投稿を更新しました！"
    else
      "更新しました！"
    end
  end
  
  def update_message_faild
    keys = params.keys
    if keys.include?('update_draft')
      word = "下書きの更新ができませんでした。"
    elsif keys.include?('change_publish')
      word = "投稿ができませんでした。"
    elsif keys.include?('update_post')
      word = "投稿の更新ができませんでした。"
    else
      word + "更新できませんでした。"
    end
    word + "お手数ですが、入力内容をご確認の上、再度お試しください。"
  end
end
