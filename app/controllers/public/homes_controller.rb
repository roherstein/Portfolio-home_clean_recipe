class Public::HomesController < ApplicationController
  
  def top
    publish_posts = Post.where(is_publish: true).order(created_at: :desc)
    @posts = Kaminari.paginate_array(publish_posts).page(params[:page]).per(6)
  end
end