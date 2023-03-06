class Public::PostsController < ApplicationController
    
  def new
    @post = Post.new
    @cleaning_tool = @post.cleaning_tools.build
    @cleaning_recipe = @post.cleaning_recipes.build
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if params[:post] 
      if @post.save(context: :publicize)
        flash[:notice]="投稿が完了しました！"
        redirect_to post_path(@post)
      else
        flash.now[:notice]="投稿できませんでした。お手数ですが、入力内容をご確認の上、再度お試しください。"
        render :new
      end
    else
      if @post.update(is_publish: false) 
        flash[:notice]="下書き保存しました！"
        redirect_to  users_mypage_path
      else
        flash.now[:notice]="保存ができませんでした。お手数ですが、入力内容をご確認の上、再度お試しください。"
        render :new
      end
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
    @post.update(post_params)
    redirect_to post_path(@post)
    
    #下書き更新
    if params[:publicize_draft] 
      @post.attributes = post_params.merge(is_publish: true)
      if @post.save(context: :publicize)
        flash[:notice]="下書きのレシピを投稿しました！"
        redirect_to post_path(@post)
      else
        @post.is_publish = false
        flash.now[:notice]="投稿ができませんでした。お手数ですが、入力内容をご確認の上、再度お試しください。"
        render :edit
      end
    #公開済みの投稿を更新
    elsif params[:update_post]
      if @post.update(is_publish: false) 
        flash[:notice]="下書き保存しました！"
        redirect_to  users_mypage_path
      else
        flash.now[:notice]="保存ができませんでした。お手数ですが、入力内容をご確認の上、再度お試しください。"
        render :edit
      end
    #下書きの更新
    else
      if @post.update(is_publish: false) 
        flash[:notice]="下書き保存しました！"
        redirect_to  users_mypage_path
      else
        flash.now[:notice]="保存ができませんでした。お手数ですが、入力内容をご確認の上、再度お試しください。"
        render :edit
      end
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
end
