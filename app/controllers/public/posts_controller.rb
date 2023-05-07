class Public::PostsController < ApplicationController
    
  def new
    @post = Post.new
    @cleaning_tool = @post.cleaning_tools.build
    @cleaning_recipe = @post.cleaning_recipes.build
  end
  
  def create
    @post = current_user.posts.build(post_params)
    @post.is_publish = false if draft?
    
    
    if @post.save
      flash[:notice] = (draft? ? "下書き保存しました！" : "投稿が完了しました！")
      redirect_to post_path(@post)
    else
      flash.now[:notice] = (draft? ? "保存ができませんでした。" : "投稿できませんでした。") + "お手数ですが、入力内容をご確認の上、再度お試しください。"
      render :new
    end
      
    #if @post.is_publish?
    #  #公開時
    #  valid = @post.valid?(:publicize)
    #else
    #  #非公開時
    #  valid = @post.valid?
    #end
    
    #if valid
    #  #バリデーション実行時エラーがない場合
    #  @post.save!
    #  flash[:notice] = (draft? ? "下書き保存しました！" : "投稿が完了しました！")
    #  redirect_to post_path(@post)
    #else
    #  #エラーがある場合
    #  flash.now[:notice] = (draft? ? "保存ができませんでした。" : "投稿できませんでした。") + "お手数ですが、入力内容をご確認の上、再度お試しください。"
    #  render :new
    #end
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
    
    #if @post.invalid?
    #  # 常に行うバリデーションでエラー
    #  render :edit
    #  return
    #end
    
    if @post.update(post_params)
      flash[:notice] = update_message_success
      redirect_to post_path(@post)
    else
      render :edit
      return
    end
  
    if (@post.is_publish || change_publish?) && @post.invalid?
      # 投稿を更新したいまたは下書き投稿のときにするバリデーションでエラー
      render :edit
      return
    end
    
    # ここに来たということはバリデーションが通っている
    
    # 下書き投稿の場合に投稿にする
    @post.is_publish = true if change_publish?
    
    # 更新処理
    #@post.update(post_params)
    #flash[:notice] = update_message_success
    #redirect_to post_path(@post)
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  def index
    if params[:category_id] then
      post_ids = PostCategory.includes(:post).where(category_id: params[:category_id],posts: {is_publish: true}).pluck(:post_id)
      @posts = Kaminari.paginate_array(Post.find(post_ids)).page(params[:page]).per(6)
    else
      publish_posts = Post.where(is_publish: true)
      @posts = Kaminari.paginate_array(publish_posts).page(params[:page]).per(6)
    end
  end
  
  def my_likes
    likes = Like.where(user_id: current_user.id).pluck(:post_id)
    @like_posts = Post.find(likes)
    @page = Kaminari.paginate_array(likes).page(params[:page]).per(20)
  end
  
  def my_comments
    comments = Comment.where(user_id: current_user.id).pluck(:post_id)
    @comment_posts = Post.find(comments)
    @page = Kaminari.paginate_array(comments).page(params[:page]).per(20)
  end
  
  def draft
    @posts = Post.where(is_publish: false, user_id: current_user.id )
    @draft_posts = Kaminari.paginate_array(@posts).page(params[:page]).per(6)
    # posts = Post.where(is_publish: false).pluck(:post_id)
    # @draft_posts = Kaminari.paginate_array(Post.find(post_id)).page(params[:page])
  end
  
  # 本当はここにストロングパラメータがあった
  
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
