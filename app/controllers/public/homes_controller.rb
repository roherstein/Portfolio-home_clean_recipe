class Public::HomesController < ApplicationController
  def top
    publish_posts = Post.where(is_publish: true)
    @posts = Kaminari.paginate_array(publish_posts).page(params[:page]).per(12)
  end
end
